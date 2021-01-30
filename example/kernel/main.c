/*
 * SPDX-License-Identifier: GPL-2.0
 * Copyright (C) 2020 Wang Nan <pi3orama@163.com>
 */

#include <stdio.h>
#include <asm/arch.h>
#include <kernel/optimization.h>

int main()
{
	printf("optimization level: %s\n", opt_level());
	printf("arch: %s\n", get_arch());
	return 0;
}
