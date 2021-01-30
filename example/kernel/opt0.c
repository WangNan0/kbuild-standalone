/*
 * SPDX-License-Identifier: GPL-2.0
 * Copyright (C) 2020 Wang Nan <pi3orama@163.com>
 */

#include <kernel/optimization.h>

static const char _optlv[] = "O0";

const char *opt_level(void)
{
	return &_optlv[0];
}
