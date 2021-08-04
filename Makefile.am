# SPDX-License-Identifier: GPL-2.0
# Copyright (C) 2020 Wang Nan <pi3orama@163.com>

EXTRA_DIST = configure.ac	\
	     README.md		\
	     Makefile.sample	\
	     kbuild		\
	     kconfig		\
	     fixdep		\
	     unifdef		\
	     example

doc_DATA = README.md
pkgdir = $(datarootdir)/kbuild-standalone
scriptsdir = $(pkgdir)/scripts

pkg_SCRIPTS	= kbuild/_fixdep
pkg_DATA 	= kbuild/Makefile.env		\
		  kbuild/Makefile.include	\
		  kbuild/Makefile.head		\
		  kbuild/Makefile.main		\
		  kbuild/Makefile.output
scripts_DATA	= kbuild/scripts/Makefile.build	\
		  kbuild/scripts/Makefile.clean	\
		  kbuild/scripts/Makefile.lib	\
		  kbuild/scripts/Makefile.host	\
		  kbuild/scripts/Makefile.compiler	\
		  kbuild/scripts/Kbuild.include

pkgconfigdir = $(libdir)/pkgconfig
pkgconfig_DATA = kbuild-standalone.pc

localbins = kbuild-mconf kbuild-conf kbuild-fixdep kbuild-unifdef

all-local: $(localbins)

clean-local:
	rm -rf __build $(localbins)

install-exec-hook: $(localbins)
	$(MKDIR_P) "$(DESTDIR)$(bindir)";	\
	$(INSTALL_PROGRAM) $(localbins) "$(DESTDIR)$(bindir)"

uninstall-hook:
	cd $(DESTDIR)$(bindir) && rm -f $(localbins)

kbuild-mconf kbuild-conf kbuild-fixdep kbuild-unifdef: __build

kbuild-fixdep:
	cp $(builddir)/__build/fixdep/fixdep $@
kbuild-conf:
	cp $(builddir)/__build/kconfig/conf $@
kbuild-mconf:
	cp $(builddir)/__build/kconfig/mconf $@
kbuild-unifdef:
	cp $(builddir)/__build/unifdef/unifdef $@

__build:
	$(MAKE) -C $(builddir) -f $(abs_top_srcdir)/Makefile.sample O=$(builddir)/__build

.PHONY: __build
