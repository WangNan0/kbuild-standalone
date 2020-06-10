# Standalone kconfig and kbuild

## Motivation

KConfig and KBuild are powerful tools for building large projects written in
mostly .c. They are parts of Linux kernel source code. Linux uses them to build
itself. Some open source projects such as busybox and UBoot also use it as
their building framework. However, sinces they are part of Linux kernel, they
have to be forked and merged into the project who wish to use it. After
forking, the connection between the project and Linux kernel is broken.
Projects choose to use them has to maintain these tools by itself to get new
features and fix bugs.

The goal of this project is to provide standalone kconfig and kbuild. Other
projects can `depend on` this project as basic tools for building like gcc and
make, instead of merging them into their own source code.

Currently, this project contains:
 * kconfig: Standalone conf and mconf executable which reads Kconfig source
   code and output .config.
 * kbuild: Basic kbuild makefile scripts are brought from Linux kernel. A wrapper
   is provided to make it work standalone.
 * fixdep, unifdef: Small tools in Linux kernel for building.

## kconfig

### Building kconfig standalone

```
 $ git clone https://github.com/WangNan0/kbuild-standalone.git
 $ cd kbuild-standalone
 $ mkdir build
 $ cd build
 $ make -C ../ -f Makefile.sample O=`pwd` -j
 $ ls ./kconfig/*conf
   ./kconfig/conf  ./kconfig/mconf
```

`conf` and `mconf` can be used to config linux kernel:

```
 $ git clone https://github.com/torvalds/linux.git
 $ cd linux

# menuconfig
 $ SRCARCH=x86 srctree=`pwd` CC=gcc /path/to/mconf ./Kconfig

# allyesconfig
 SRCARCH=x86 srctree=`pwd` CC=gcc /path/to/conf --allyesconfig ./Kconfig

# defconfig
 SRCARCH=arm srctree=`pwd` CC=arm-none-eabi-gcc /path/to/conf \
	--defconfig=arch/arm/configs/vexpress_defconfig ./Kconfig
```

## kbuild

Makefile.sample is also an simple example about how kbuild standalone can be
used in other project by simply setting following make variables:

* `KBUILD_STANDALONE_SRCDIRS:` source directories of this project.
* `KBUILD_STANDALONE_TARGETS:` targets to build using kbuild standalone.
* `KBUILD_STANDALONE_PREPARE:` targets to build before `KBUILD_STANDALONE_TARGETS`
* `<target>_GOAL:`             make goals list passed to `<target>/Makefile`.
* `<target>_CONF:`             config of a target, like `need-builtin=1`.

Then include Makefile.include which can be found using pkg-config.

## Maintenance

This project keeps syncing with Linux kernel. When Linux has a new release,
we sync updates from Linux kernel to keep us identical with upstream.
Therefore, we will not accept new feature or bugfix by our own. Instead, we
try to make them upstream then sync them back.

Version number of this project comes from source version of Linux kernel.
It contains 2 or 3 digits. The first 2 digits are version and patchlevel
of corresponding Linux kernel (for exmaple, 5.6). The third digit is vesion
of this project itself. Each time when bumping Linux kernel version, the third
digit would be reset to 0 and ignored.
