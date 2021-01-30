/*
 * SPDX-License-Identifier: GPL-2.0
 * Copyright (C) 2020 Wang Nan <pi3orama@163.com>
 */

static const char arch[] = "x86_64";

const char *get_arch(void)
{
	return &arch[0];
}
