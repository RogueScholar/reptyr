#!usr/bin/env bash

# Some working variables
G="\033[32m"
B="\033[39m"
Y="\033[33m"
OK="${G}OK${B}"
ERROR="${Y}ERROR${B}"

PACKAGE_DIR=./package

rm -rf $PACKAGE_DIR
mkdir $PACKAGE_DIR

wget -q https://github.com/nelhage/reptyr/archive/reptyr-0.7.0.tar.gz -O $PACKAGE_DIR/reptyr-0.7.0.orig.tar.gz

if [ $? -ne 0 ]; then
        echo "An error occured while downloading the reptyr tarball"
        exit 1
fi

tar -xzf $PACKAGE_DIR/reptyr-0.7.0.orig.tar.gz -C $PACKAGE_DIR

mv $PACKAGE_DIR/reptyr-reptyr-0.7.0 $PACKAGE_DIR/reptyr-0.7.0

cp -R debian/ $PACKAGE_DIR/reptyr-0.7.0/debian/

cd $PACKAGE_DIR/reptyr-0.7.0/

perl -i -pe "s/unstable/$(lsb_release -cs)/" debian/changelog

echo -n "Building package release, be patient ..."

debuild -us -uc

if [ $? -eq 0 ] ; then
  echo -e " $OK !"
  echo "This look like good news, package succesfully build in $PACKAGE_DIR :)"
else
  echo -e "${ERROR}"
  echo "Bad news, something did not happen as expected, check .build file in $PACKAGE_DIR to get more information."
fi
