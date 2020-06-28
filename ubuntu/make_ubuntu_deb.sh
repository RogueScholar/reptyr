#!/usr/bin/env bash

# Ensure we have elevated privileges needed to install build dependencies
[ "$UID" -eq 0 ] || exec sudo bash "$0" "$@"

# If there is a failure in a pipeline, return the error status of the
# first failed process rather than the last command in the sequence
set -o pipefail

# Explicitly set IFS to only newline and tab characters, eliminating errors
# caused by absolute paths where directory names contain spaces, etc.
IFS="$(printf '\n\t')"

# Find the absolute path to the script, strip non-POSIX-compliant control
# characters, convert to Unicode and make that folder the working directory, in
# case the script is invoked from another directory or through a symlink.
typeset -r SCRIPT_DIR="$(dirname "$(realpath -q "${BASH_SOURCE[0]}")" |
  LC_ALL=POSIX tr -d '[:cntrl:]' | iconv -cs -f UTF-8 -t UTF-8)"
cd "${SCRIPT_DIR}" || exit 1

# Information about the file paths, build environment and Perl module source
PACKAGE_NAME="reptyr"
PACKAGE_DIR="${SCRIPT_DIR}/tmp/$(lsb_release -cs)"
DEBIAN_VER="$(grep -P -m 1 -o '\d*\.\d*\.\d*-\d*' debian/changelog)"
BUILD_ARCH="$(dpkg --print-architecture)"

# Save the final build status messages to functions
good_news() {
  echo -e '\t\e[37;42mSUCCESS:\e[0m I have good news!'
  echo -e "\\t\\t${PACKAGE_NAME}_${DEBIAN_VER}_${PACKAGE_ARCH}.deb was successfully built in ${PACKAGE_DIR}!"
  echo -e "\\n\\t\\tYou can install it by typing: sudo apt install ${PACKAGE_DIR}/${PACKAGE_NAME}_${DEBIAN_VER}_${BUILD_ARCH}.deb"
}
bad_news() {
  echo -e '\t\e[37;41mERROR:\e[0m I have bad news... :-('
  echo -e '\t\tThe build process was unable to complete successfully.'
  echo -e "\\t\\tPlease check the ${PACKAGE_DIR}/${PACKAGE_NAME}_${DEBIAN_VER}_${BUILD_ARCH}.build file to get more information."
}

# Let's check that we have an oven to bake the package before we go shopping for the ingredients
if [ ! -x "$(command -v debuild)" ]; then
  echo -e "\\t\\e[37;41mERROR:\\e[0m The debuild command is required. Please install the 'devscripts' package and try again."
  exit 1
fi

# Delete the build directory if it exists from earlier attempts then create it anew and empty
if [ -d "${PACKAGE_DIR}" ]; then
  rm -rf "${PACKAGE_DIR}"
  mkdir -p "${PACKAGE_DIR}"
else
  mkdir -p "${PACKAGE_DIR}"
fi

# Find and declare the data transfer agent we'll use
if [ -x "$(command -v curl)" ]; then
  typeset -r TRANSFER_AGENT=curl
elif [ -x "$(command -v wget)" ]; then
  typeset -r TRANSFER_AGENT=wget
else
  echo -e '\t\e[37;41mERROR:\e[0m Neither curl nor wget was available to perform HTTP requests; please install one and try again.'
  exit 1
fi

# Download the name of the latest tagged release from GitHub
echo "Reading the response to https://github.com/nelhage/reptyr/releases/latest..."

case $TRANSFER_AGENT in
  curl)
    RESPONSE=$(curl -s -L -w 'HTTPSTATUS:%{http_code}' -H 'Accept: application/json' "https://github.com/nelhage/reptyr/releases/latest")
    PACKAGE_VER=$(echo "${RESPONSE}" | sed -e 's/HTTPSTATUS\:.*//g' | tr -s '\n' ' ' | sed 's/.*"tag_name":"//' | sed 's/".*//')
    HTTP_CODE=$(echo "${RESPONSE}" | tr -d '\n' | sed -e 's/.*HTTPSTATUS://')
    ;;
  wget)
    TEMP="$(mktemp)"
    RESPONSE=$(wget -q --header='Accept: application/json' -O - --server-response "https://github.com/nelhage/reptyr/releases/latest" 2>"${TEMP}")
    PACKAGE_VER=$(echo "${RESPONSE}" | tr -s '\n' ' ' | sed 's/.*"tag_name":"//' | sed 's/".*//')
    HTTP_CODE=$(awk '/^  HTTP/{print $2}' <"${TEMP}" | tail -1)
    rm "${TEMP}"
    ;;
  *)
    echo -e '\t\e[37;41mERROR:\e[0m Neither curl nor wget was available to perform HTTP requests; please install one and try again.'
    exit 1
    ;;
esac

# Print the tagged version, or if we came up empty, give the user something to start troubleshooting with
if [ "${HTTP_CODE}" != 200 ]; then
  echo -e "\\t\\e[37;41mERROR:\\e[0m Request to GitHub for latest tagged release failed with code ${HTTP_CODE}."
  exit 1
else
  echo -e "\\t\\e[37;42mOK:\\e[0m Latest Release Tag = ${PACKAGE_VER}"
fi

# Just hand over the tarball and nobody gets hurt, ya see?
echo "Downloading https://github.com/nelhage/reptyr/archive/${PACKAGE_VER}.tar.gz..."

case $TRANSFER_AGENT in
  curl)
    HTTP_CODE=$(curl -# --retry 3 -w '%{http_code}' -L "https://github.com/nelhage/reptyr/archive/${PACKAGE_VER}.tar.gz" \
      -o "${PACKAGE_DIR}/${PACKAGE_NAME}_${PACKAGE_VER}.orig.tar.gz")
    ;;
  wget)
    HTTP_CODE=$(wget -qc -t 3 --show-progress -O "${PACKAGE_DIR}/${PACKAGE_NAME}_${PACKAGE_VER}.orig.tar.gz" \
      --server-response "https://github.com/nelhage/reptyr/archive/${PACKAGE_VER}.tar.gz" 2>&1 |
      awk '/^  HTTP/{print $2}' | tail -1)
    ;;
  *)
    echo -e "\\t\\e[37;41mERROR:\\e[0m Request to GitHub for latest release file failed with code ${HTTP_CODE}."
    exit 1
    ;;
esac

# Print the result of the tarball retrieval attempt
if [ "${HTTP_CODE}" != 200 ]; then
  echo -e "\\t\\e[37;41mERROR:\\e[0m Request to GitHub for latest tagged release failed with code ${HTTP_CODE}."
  exit 1
else
  echo -e '\t\e[37;42mOK:\e[0m Successfully downloaded the latest reptyr package from GitHub.'
fi

# Unpack the tarball in the build directory
echo "Unpacking the release archive..."
tar -xzf "${PACKAGE_DIR}"/"${PACKAGE_NAME}"_"${PACKAGE_VER}".orig.tar.gz -C "${PACKAGE_DIR}"
mv "$PACKAGE_DIR"/"${PACKAGE_NAME}"-"${PACKAGE_NAME}"-"${PACKAGE_VER}" "$PACKAGE_DIR"/"${PACKAGE_NAME}"-"${PACKAGE_VER}"

# Copy the Debian packaging files into the same directory as the source code and
# make that source+packaging folder the new working directory
cp -R "${SCRIPT_DIR}"/debian "${PACKAGE_DIR}"/"${PACKAGE_NAME}"-"${PACKAGE_VER}"
cd "${PACKAGE_DIR}"/"${PACKAGE_NAME}"-"${PACKAGE_VER}" || exit 1

# Create and install a dummy package to satisfy the build dependencies, then delete it
mk-build-deps -ir debian/control

# Replace the LTS distribution string "bionic" with the distribution codename of the build system
sed -i "1s/bionic/$(lsb_release -cs)/" debian/changelog

# Call debuild to oversee the build process and produce an output string for the user based on its exit code
## (A separate invocation style is triggered if the script is run by a CircleCI executor for development testing)
echo -e "\\tBuilding package ${PACKAGE_NAME}_${DEBIAN_VER}_${BUILD_ARCH}.deb, please be patient..."

if [ -n "$CIRCLECI" ]; then
  if debuild -D -F -sa -us -uc --lintian-opts -EIi --pedantic; then
    good_news
    exit 0
  else
    bad_news
    exit 1
  fi
else
  if debuild -b -us -uc; then
    good_news
    exit 0
  else
    bad_news
    exit 1
  fi
fi
