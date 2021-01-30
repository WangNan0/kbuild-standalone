# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020 Wang Nan <pi3orama@163.com>

set -e

if [ "x${KBUILD_VERBOSE}" = "x1" ]
then
    set -x
fi

. ./${KCONFIG_CONFIG}

kernel_output=$1
shift 1

${AR} rcsTP built-in.a "$@"
${CC} built-in.a -o $kernel_output
