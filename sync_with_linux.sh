#!/usr/bin/env bash
function usage()
{
  echo "Usage:"
  echo "$0 <path-to-linux-kernel>"
  exit 1
}

if [ ! -d "$1" ];
then
  usage $0
fi

LINUX_SRC="$1"
DST="."

rm -rf ${DST}/fixdep
cp -rv ${LINUX_SRC}/scripts/basic ${DST}/fixdep

for f in Kbuild.include  Makefile.build  Makefile.clean  Makefile.host  Makefile.lib Makefile.userprogs Makefile.compiler; do
  cp -v ${LINUX_SRC}/scripts/$f ${DST}/kbuild/scripts/$f
done

rm -rf ${DST}/kconfig
cp -rv ${LINUX_SRC}/scripts/kconfig ${DST}/kconfig
cp -v ${LINUX_SRC}/scripts/unifdef.c ${DST}/unifdef/
