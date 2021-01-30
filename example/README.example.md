# Example

Here is a relative complex demo project using kbuild-standalone. It demonstrates
a recommended configuration.

It has following features:
 * Support `make menuconfig` and some defconfig targets as Linux kernel
 * Support more than one architecture
 * More than one source directories
 * Use config option to control files to be built
 * tools/ directory is not source directory but required by `menuconfig`
 * Link multiple built-in.a to executable with shell script
 * Trace dependency correctly

Use following command to start playing with this demo:
```
 $ mkdir build
 $ cd build
 $ make ARCH=x86_64 -C ../ O=`pwd` alldefconfig
 $ make ARCH=x86_64 -C ../ O=`pwd` kernel.exec
```
