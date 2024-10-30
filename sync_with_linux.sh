#!/usr/bin/env bash
function usage()
{
  echo "Usage:"
  echo "$0 <path-to-linux-kernel>"
  exit 1
}

if [ ! -d "$1" ];
then
  LINUX_SRC="/usr/src/linux-headers-$(uname -r)"
  if [ ! -d "$LINUX_SRC" ];
  then
    usage $0
    else
  echo "sync with $LINUX_SRC"
  fi
fi

DST="."

rm -rf ${DST}/fixdep
cp -rv ${LINUX_SRC}/scripts/basic ${DST}/fixdep

for f in Kbuild.include  Makefile.build  Makefile.clean  Makefile.host  Makefile.lib Makefile.userprogs Makefile.compiler; do
  cp -v ${LINUX_SRC}/scripts/$f ${DST}/kbuild/scripts/$f
done

rm -rf ${DST}/kconfig
cp -rv ${LINUX_SRC}/scripts/kconfig ${DST}/kconfig
cp -v ${LINUX_SRC}/scripts/unifdef.c ${DST}/unifdef/
