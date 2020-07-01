# reptyr - A tool for "re-pty-ing" programs [![Repository License](https://img.shields.io/github/license/RogueScholar/reptyr.svg?logo=SPDX&style=for-the-badge)](https://github.com/RogueScholar/reptyr/blob/master/COPYING)

[![GitHub last commit](https://img.shields.io/github/last-commit/RogueScholar/reptyr.svg?logo=GitHub&style=for-the-badge)](https://github.com/RogueScholar/reptyr/commits/debian) ![GitHub repo size](https://img.shields.io/github/repo-size/RogueScholar/reptyr.svg?logo=GitHub&style=for-the-badge)

___
_Forked from [reptyr](https://github.com/nelhage/reptyr) by [Nelson Elhage](https://github.com/nelhage), © 2010-2018._

[![GitHub issues](https://img.shields.io/github/issues/nelhage/reptyr.svg?logo=GitHub&style=for-the-badge)](https://github.com/nelhage/reptyr/issues) [![GitHub stars](https://img.shields.io/github/stars/nelhage/reptyr.svg?logo=GitHub&style=for-the-badge)](https://github.com/nelhage/reptyr/stargazers)
___

#### reptyr is a utility for taking an existing running program and attaching it to a new terminal

Started a long-running process over ssh, but have to leave and don't want to
interrupt it? Just start a screen, use reptyr to grab it, and then kill the ssh
session and head on home.

## Purpose

On many Ubuntu versions, the reptyr package available in the official
repositories is outdated. These files are provided to aid you in building your
own package to install from the most recent release.

## How to build

### Dependences

If starting from a very clean Ubuntu installation, please make sure you have
`software-properties-common` and the "multiverse" repository enabled, then
install the basic packages required for .deb package creation:

```bash
sudo apt update
sudo apt install -y software-properties-common
sudo add-apt-repository -y multiverse
sudo apt install -y wget git build-essential debhelper devscripts
```

### Building the package

```bash
git clone -b debian https://github.com/nelhage/reptyr.git
cd reptyr/ubuntu
./make_deb_package.sh
```

## Installation

The current version of reptyr (0.7.0) has been built and packaged for Ubuntu
20.04 LTS "Focal Fossa" and above and made available on the Releases page of
this repository as well as on a Launchpad PPA for those who wish to install it
via the apt package manager rather than building from source. All packages are
signed with a PGP key whose fingerprint is: [3E1CFE02E60717F6](https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x3E1CFE02E60717F6)

<details><summary>4096-bit RSA PGP key</summary>
<p>

```
-----BEGIN PGP PUBLIC KEY BLOCK-----
Version: SKS 1.1.6
Comment: Hostname: keyserver.ubuntu.com

mQINBFysaIABEADtDmKlPXlm/Rj4icrtXPa1Slhu55rrEfMKG+IuPvsDbjyvAic381+h2RmC
Kk6LQ/Jm7Cx12iVoQRWIDdlWKkG+797OA91sFOiCfNfAAv1HcvPcQhYSMY3jAtEMvccfQxRY
DqEk0samegteU/tNCi7qSGP/yQ5jeONFWMNEos0xAIcxdDEmLDGvkr7acfRFgpekEvilpysg
kKUf0MIJB42FjAUeXGEMm9O38YuGSdOgQSKzEQydKEhMAG0GRq8z12kcR9mNuYU73Xh+OsAI
XMBDBgpAZVUDsoJXuUCYq9lx4fsDUdDusaKH0m/SpmgIPF55rWn7TfUgzQjj43KOBjZEGmQj
2j6Bxa6CtVqrpafVp/GspsKVcP3OZqqPWPzEGlydf+hTmE80ERWNVMvq1fMld4Fw/7G9uJet
YrlWdsP0dUqLWYXuwDOwKa3XOMoJ7OQeSBrMXKoRFOfWGzIXVhABmwkfIX6U+urq1IVl8XGT
hjk1lm027zQaQ88oTC+rlH8N41I62HDeu3XRY81Af+/hLKPymgX71glN5POpZqbLfkpSmyGr
SG0e79QWjBILU9kU9la+p4rTYqEQEO8O3ez+pqhgAhJTnWuq3t7fYTVlkM3yv+wO6F+gkyZX
0wAAll3uDUIf5FS1UAjaMpBUTbchPXXifmVz4FsRn3Ps/qtNhQARAQABtCBMYXVuY2hwYWQg
UFBBIGZvciBQZXRlciBKLiBNZWxsb4kCOAQTAQIAIgUCXKxogAIbAwYLCQgHAwIGFQgCCQoL
BBYCAwECHgECF4AACgkQPhz+AuYHF/aN0w//V2j+YA1i5XUxa9ukBUuyiDIRv83rr08URp0Q
5o8DIMBAj79lkKQ8/tePqR+J1vTns1lBqPX8y7jcUn2h162WwdpHnOed1tE4w/DeICDyoDRZ
kF+uUS+4Y4FoDaXLyvGDxjsXY30eFu0TSxsuRLmVmAClpl1fJELDRfqrkUbsVJRP+zNaAOrk
De1vWn1AAEQ0SqQ3Wn2EtaFsOHF4rAJZeqJHoxbPJn0MJ5v5sxCORbc4LMrBmH388tojLT0Q
UngkZ61O/R38H5mluQ+ZRV8jKVvHXXklfTiCNzhJx+lUooZRqIqAX0FeY+IpBTlYgZG7U9Mi
7nUsSrspR8yjV84hc5xlwL6XXKlQBxJoCDYVEZsVvIFxI38Drua6dGtmwfATM3qTU/35l3TU
28nx2CvI6s1fKfVB2Ix7+sDa5FJssgd7gRRd3fyw760UHyAn5ASiIYgsBZTDX+R7RNz8kPGF
/2rmasnWRhkc/cicH+JQ3/ckxOWJM9kRoaX6UVhlcU3J7YYxTbD7WfPOyLzcIqXFZWh2XfCq
pliLwZ1hRJ3w8BIS1WltT47t/JzaFR+IjDkl2UuRAkk76blX8w6MGWXurx805ybNc1Bevp+a
NSPtJB/vAOg4kBFFrCAClRnJUptZgM57pIESo/sd3vNd5kWPOF1EF5V74NVP0qm+WN5wPz4=
=VZ00
-----END PGP PUBLIC KEY BLOCK-----
```

</p>
</details>
<br />
which apt will download and verify for you automatically. To add the PPA to your
Ubuntu system's list of package sources and install reptyr, open a terminal
window and enter the following:

```bash
sudo apt install -y software-properties-common
sudo add-apt-repository -y multiverse
sudo add-apt-repository -yus ppa:roguescholar/ppa
sudo apt install -y reptyr
```

### Usage

    reptyr PID

Invoking reptyr as shown above will grab the process with id PID and attach it
to your current terminal.

After attaching, the process will take input from and write output to the new
terminal, including ^C and ^Z. (Unfortunately, if you background it, you will
still have to run "bg" or "fg" in the old terminal. This is likely impossible to
fix in a reasonable way without patching your shell.)

### Typical usage pattern

* Start a long running process, e.g. `top`
* Background the process with CTRL-Z
* Resume the process in the background: `bg`
* Display your running background jobs with `jobs -l`, this should look like:
** `[1]+  4711 Stopped (signal)        top`
** (The `-l` in `jobs -l` makes sure you'll get the PID)
* Disown the jobs from the current parent with `disown top`. After that, `jobs`
will not show the job any more, but `ps -a` will.
* Start your terminal multiplexer of choice, e.g. `tmux`
* Reattach to the backgrounded process: `reptyr 4711`
* Detach your terminal multiplexer (e.g. CTRL-A D) and close ssh
* Reconnect ssh, attach to your multiplexer (e.g. `tmux attach`), rejoice!

### "But wait, isn't this just screenify?"

There's a shell script called "screenify" that's been going around the internet
for nigh on 10 years now that uses gdb to (supposedly) accomplish the same
thing. The difference is that reptyr works much, much, better.

If you attach a "less" using screenify, it will still take input from the old
terminal. If you attach an ncurses program using screenify, and resize the
window, your program won't notice. If you attach a process with screenify, ^C in
the new terminal won't work.

reptyr fixes all of these problems, and is the only such tool I know of that
does so. See below for some more details on how it accomplishes this.

### Portability

reptyr supports Linux and FreeBSD. Not all functionality is currently available
on FreeBSD. (Notably, FreeBSD doesn't support `reptyr -T` at this time.

`reptyr` uses ptrace to attach to the target and control it at the syscall
level, so it is highly dependent on details of the syscall API, available
syscalls, and terminal ioctl()s. A port to other operating systems may be
technically feasible, but requires significant low-level knowledge of the
relevant platform, and may entail significant refactors.

reptyr works on i386, x86_64, PowerPC, ARMv7 and aarch64 (ARM 64-bit). Ports to
other architectures should be straightforward, and should in most cases be as
simple as adding an `arch/ARCH.h` file and adding a clause to the ifdef ladder
in `ptrace.c`.

### ptrace_scope on Ubuntu Maverick and up

`reptyr` depends on the `ptrace` system call to attach to the remote program. On
Ubuntu Maverick and higher, this ability is disabled by default for security
reasons. You can enable it temporarily by doing

```bash
# echo 0 > /proc/sys/kernel/yama/ptrace_scope
```

as root, or permanently by editing the file /etc/sysctl.d/10-ptrace.conf, which
also contains more information about exactly what this setting accomplishes.

### reptyr -l

As a bonus feature, if you run "reptyr -l", reptyr will create a new
pseudo-terminal pair with nothing attached to the slave end, and print its name
out.

If you are debugging a program in gdb, you can pass that name to "set
inferior-pty". Because there is no existing program listening to that tty, this
will work much better than passing an existing shell's terminal.

### How does it work?

The main thing that reptyr does that no one else does is that it actually
changes the controlling terminal of the process you are attaching. I wrote a
[blog post](https://blog.nelhage.com/2011/02/changing-ctty/) explaining just
what the shenanigans involved are.

### Pronunciation

I pronounce it like "repeater", but since that's easily ambiguous, "re-P-T-Y-er"
is also acceptable.

### License

[![SPDX Logo](https://user-images.githubusercontent.com/15098724/57586996-dc44ae00-74b2-11e9-92a4-8ad1b6d81d0a.png)](https://spdx.org/licenses/MIT)<br />SPDX-License-Identifier: MIT

### Credits

reptyr was written by Nelson Elhage <nelhage@nelhage.com>. Contact him with any
questions or bug reports. <https://github.com/nelhage/reptyr>

### Contact

[![Keybase PGP](https://img.shields.io/keybase/pgp/rscholar.svg?label=Keybase.io&logo=Keybase&logoColor=white&style=for-the-badge)](https://keybase.io/rscholar) [![Twitter Follow](https://img.shields.io/twitter/follow/SingularErgoSum.svg?color=orange&label=Follow%20%40SingularErgoSum&logo=Twitter&style=for-the-badge)](https://twitter.com/SingularErgoSum)
