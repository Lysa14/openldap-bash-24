# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2022 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
##---------------------------------------------------------------------------
#
# Top-level Makefile template
#

PACKAGE= OpenLDAP
VERSION= 2.6.7+dfsg-1~exp1ubuntu8.1
RELEASEDATE= 2024/01/29


SHELL = /bin/bash

top_builddir = ../..

srcdir = ../../../../libraries/libldap
top_srcdir = ../../../..
VPATH = ../../../../libraries/libldap
prefix = /usr
exec_prefix = ${prefix}
ldap_subdir = /ldap

bindir = ${exec_prefix}/bin
datarootdir = ${prefix}/share
datadir = ${datarootdir}$(ldap_subdir)
includedir = ${prefix}/include
infodir = ${prefix}/share/info
libdir = ${prefix}/lib/x86_64-linux-gnu
libexecdir = ${prefix}/lib
localstatedir = /var
mandir = ${prefix}/share/man
moduledir = ${prefix}/lib$(ldap_subdir)
sbindir = ${exec_prefix}/sbin
sharedstatedir = ${prefix}/com
sysconfdir = /etc$(ldap_subdir)
schemadir = $(sysconfdir)/schema
systemdsystemunitdir = 

PLAT = UNIX
EXEEXT = 
OBJEXT = o

BUILD_LIBS_DYNAMIC = shared

SHTOOL = $(top_srcdir)/build/shtool

INSTALL = $(SHTOOL) install -c
INSTALL_PROGRAM = $(INSTALL)
INSTALL_DATA = $(INSTALL) -m 644
INSTALL_SCRIPT = $(INSTALL)

STRIP_OPTS = -s

LINT = lint
5LINT = 5lint

MKDEP = $(top_srcdir)/build/mkdep $(MKDEPFLAG) \
	-d "$(srcdir)" -c "$(MKDEP_CC)" -m "$(MKDEP_CFLAGS)"
MKDEP_CC	= x86_64-linux-gnu-gcc
MKDEP_CFLAGS = -M

MKVERSION = $(top_srcdir)/build/mkversion -v "$(VERSION)"

LIBTOOL = $(SHELL) $(top_builddir)/libtool
LIBVERSION = 2:200:0
LTVERSION = -version-info $(LIBVERSION)

# libtool --only flag for libraries: platform specific
NT_LTONLY_LIB = # --only-$(BUILD_LIBS_DYNAMIC)
LTONLY_LIB = $(UNIX_LTONLY_LIB)

# libtool --only flag for modules: depends on linkage of module
# The BUILD_MOD macro is defined in each backend Makefile.in file
LTONLY_yes = --tag=disable-shared
LTONLY_mod = --tag=disable-static
LTONLY_MOD = $(LTONLY_$(BUILD_MOD))

# platform-specific libtool flags
NT_LTFLAGS_LIB = -no-undefined -avoid-version -rpath $(libdir)
NT_LTFLAGS_MOD = -no-undefined -avoid-version -rpath $(moduledir)
UNIX_LTFLAGS_LIB = $(LTVERSION) -rpath $(libdir)
UNIX_LTFLAGS_MOD = $(LTVERSION) -rpath $(moduledir)

# libtool flags
LTFLAGS     = $(UNIX_LTFLAGS)
LTFLAGS_LIB = $(UNIX_LTFLAGS_LIB)
LTFLAGS_MOD = $(UNIX_LTFLAGS_MOD)

# LIB_DEFS defined in liblber and libldap Makefile.in files.
# MOD_DEFS defined in backend Makefile.in files.

# platform-specific LINK_LIBS defined in various Makefile.in files.
# LINK_LIBS referenced in library and module link commands.
LINK_LIBS = $(MOD_LIBS) $(UNIX_LINK_LIBS)

# compiler options for versioned library symbol support
OL_VERSIONED_SYMBOLS = -Wl,--version-script=

LTSTATIC = 

LTLINK   = $(LIBTOOL) --mode=link \
	$(CC) $(LTSTATIC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS)

LTCOMPILE_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=compile \
	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(LIB_DEFS) -c

LTLINK_LIB = $(LIBTOOL) $(LTONLY_LIB) --mode=link \
	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_LIB) $(SYMBOL_VERSION_FLAGS)

LTCOMPILE_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=compile \
	$(CC) $(LT_CFLAGS) $(LT_CPPFLAGS) $(MOD_DEFS) -c

LTLINK_MOD = $(LIBTOOL) $(LTONLY_MOD) --mode=link \
	$(CC) $(LT_CFLAGS) $(LDFLAGS) $(LTFLAGS_MOD)

LTINSTALL = $(LIBTOOL) --mode=install $(INSTALL) 
LTFINISH = $(LIBTOOL) --mode=finish

# Misc UNIX commands used in build environment
AR = ar
BASENAME = basename
CAT = cat
CHMOD = chmod
DATE = date
ECHO = $(SHTOOL) echo
HOSTNAME = $(SHTOOL) echo -e "%h%d"
LN = $(SHTOOL) mkln
LN_H = $(LN)
LN_S = $(LN) -s
MAKEINFO = @MAKEINFO@
MKDIR = $(SHTOOL) mkdir -p
MV = $(SHTOOL) move
PWD = pwd
RANLIB = ranlib
RM = rm -f
SED = sed
SUBST = $(SHTOOL) subst

# For manual pages
# MANCOMPRESS=@MANCOMPRESS@
# MANCOMPRESSSUFFIX=@MANCOMPRESSSUFFIX@
MANCOMPRESS=$(CAT)
MANCOMPRESSSUFFIX=

SOELIM=soelim

INCLUDEDIR= $(top_srcdir)/include
LDAP_INCPATH= -I$(LDAP_INCDIR) -I$(INCLUDEDIR)
LDAP_LIBDIR= $(top_builddir)/libraries

CLIENT_LIBS = 

LUTIL_LIBS =  -lcrypt
LTHREAD_LIBS =  

SLAPD_NDB_LIBS = 
WT_LIBS = 

LEVENT_LIBS = 

LDAP_LIBLBER_LA = $(LDAP_LIBDIR)/liblber/liblber.la
LDAP_LIBLDAP_LA = $(LDAP_LIBDIR)/libldap/libldap.la

LDAP_LIBREWRITE_A = $(LDAP_LIBDIR)/librewrite/librewrite.a
LDAP_LIBLUNICODE_A = $(LDAP_LIBDIR)/liblunicode/liblunicode.a
LDAP_LIBLUTIL_A = $(LDAP_LIBDIR)/liblutil/liblutil.a

LDAP_L = $(LDAP_LIBLUTIL_A) \
	$(LDAP_LIBLDAP_LA) $(LDAP_LIBLBER_LA)
SLAPD_L = $(LDAP_LIBLUNICODE_A) $(LDAP_LIBREWRITE_A) \
	$(LDAP_LIBLUTIL_A) $(LDAP_LIBLDAP_LA) $(LDAP_LIBLBER_LA)
LLOADD_L = $(LDAP_LIBLUTIL_A) $(LDAP_LIBLDAP_LA) \
	$(LDAP_LIBLBER_LA)

WRAP_LIBS = -lwrap
# AutoConfig generated 
AC_CC	= x86_64-linux-gnu-gcc
AC_CFLAGS = -g -O2 -fno-omit-frame-pointer -mno-omit-leaf-frame-pointer -ffile-prefix-map=/home/lysa/openldap-bash-24/openldap-2.6.7=. -flto=auto -ffat-lto-objects -fstack-protector-strong -fstack-clash-protection -Wformat -Werror=format-security -fcf-protection -fdebug-prefix-map=/home/lysa/openldap-bash-24/openldap-2.6.7=/usr/src/openldap-2.6.7+dfsg-1~exp1ubuntu8.1 -Wall -D_FILE_OFFSET_BITS=64 -D_GNU_SOURCE
AC_DEFS = -Wdate-time -D_FORTIFY_SOURCE=3 # -DHAVE_CONFIG_H
AC_LDFLAGS = -Wl,-Bsymbolic-functions -flto=auto -ffat-lto-objects -Wl,-z,relro -Wl,-z,now -Wl,-z,now
AC_LIBS = 

SASL_LIBS = -lsasl2
TLS_LIBS = -lgnutls
AUTH_LIBS = 
ARGON2_LIBS = -largon2
SECURITY_LIBS = $(SASL_LIBS) $(TLS_LIBS) $(AUTH_LIBS)
SYSTEMD_LIBS = 

MODULES_CPPFLAGS = 
MODULES_LDFLAGS = -dlopen self
MODULES_LIBS = -lltdl
SLAPD_PERL_LDFLAGS = 

SLAPD_SQL_LDFLAGS = 
SLAPD_SQL_INCLUDES = 
SLAPD_SQL_LIBS = -lodbc

SLAPD_LIBS =    -lodbc   $(SYSTEMD_LIBS)
LLOADD_LIBS =  $(LEVENT_LIBS)

# Our Defaults
CC = $(AC_CC)
DEFS = $(LDAP_INCPATH) $(XINCPATH) $(XDEFS) $(AC_DEFS) $(DEFINES)
CFLAGS = $(AC_CFLAGS) $(DEFS)
LDFLAGS = $(LDAP_LIBPATH) $(AC_LDFLAGS) $(XLDFLAGS)
LIBS = $(XLIBS) $(XXLIBS) $(AC_LIBS) $(XXXLIBS)

LT_CFLAGS = $(AC_CFLAGS)
LT_CPPFLAGS = $(DEFS)

all:		all-common all-local FORCE
install:	install-common install-local FORCE
clean:		clean-common clean-local FORCE
veryclean:	veryclean-common veryclean-local FORCE
depend:		depend-common depend-local FORCE

# empty common rules
all-common:
install-common:
clean-common:
veryclean-common:	clean-common FORCE
depend-common:
lint-common:
lint5-common:

# empty local rules
all-local:
install-local:
clean-local:
veryclean-local:	clean-local FORCE
depend-local:
lint-local:
lint5-local:

veryclean: FORCE
	$(RM) Makefile
	$(RM) -r .libs

Makefile: Makefile.in $(top_srcdir)/build/top.mk

pathtest:
	$(SHTOOL) --version

# empty rule for forcing rules
FORCE:

##---------------------------------------------------------------------------

# Makefile.in for LDAP -lldap
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2022 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.

LIBRARY = libldap.la

PROGRAMS = apitest dntest ftest ltest urltest testavl

SRCS	= bind.c open.c result.c error.c compare.c search.c \
	controls.c messages.c references.c extended.c cyrus.c \
	modify.c add.c modrdn.c delete.c abandon.c \
	sasl.c sbind.c unbind.c cancel.c  \
	filter.c free.c sort.c passwd.c whoami.c vc.c \
	getdn.c getentry.c getattr.c getvalues.c addentry.c \
	request.c os-ip.c url.c pagectrl.c sortctrl.c vlvctrl.c \
	init.c options.c print.c string.c util-int.c schema.c \
	charray.c os-local.c dnssrv.c utf-8.c utf-8-conv.c \
	tls2.c tls_o.c tls_g.c \
	turn.c ppolicy.c dds.c txn.c ldap_sync.c stctrl.c \
	assertion.c deref.c ldifutil.c ldif.c fetch.c lbase64.c \
	msctrl.c psearchctrl.c threads.c rdwr.c tpool.c rq.c \
	thr_posix.c thr_thr.c thr_nt.c thr_pth.c thr_debug.c \
	account_usability.c avl.c tavl.c testavl.c

OBJS	= bind.lo open.lo result.lo error.lo compare.lo search.lo \
	controls.lo messages.lo references.lo extended.lo cyrus.lo \
	modify.lo add.lo modrdn.lo delete.lo abandon.lo \
	sasl.lo sbind.lo unbind.lo cancel.lo \
	filter.lo free.lo sort.lo passwd.lo whoami.lo vc.lo \
	getdn.lo getentry.lo getattr.lo getvalues.lo addentry.lo \
	request.lo os-ip.lo url.lo pagectrl.lo sortctrl.lo vlvctrl.lo \
	init.lo options.lo print.lo string.lo util-int.lo schema.lo \
	charray.lo os-local.lo dnssrv.lo utf-8.lo utf-8-conv.lo \
	tls2.lo tls_o.lo tls_g.lo \
	turn.lo ppolicy.lo dds.lo txn.lo ldap_sync.lo stctrl.lo \
	assertion.lo deref.lo ldifutil.lo ldif.lo fetch.lo lbase64.lo \
	msctrl.lo psearchctrl.lo threads.lo rdwr.lo tpool.lo rq.lo \
	thr_posix.lo thr_thr.lo thr_nt.lo thr_pth.lo thr_debug.lo \
	account_usability.lo avl.lo tavl.lo

LDAP_INCDIR= ../../include       
LDAP_LIBDIR= ../../libraries

LIB_DEFS = -DLDAP_LIBRARY

XLIBS = $(LIBRARY) $(LDAP_LIBLBER_LA) $(LDAP_LIBLUTIL_A)
XXLIBS = $(SECURITY_LIBS) $(LUTIL_LIBS)
NT_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS)
UNIX_LINK_LIBS = $(LDAP_LIBLBER_LA) $(AC_LIBS) $(SECURITY_LIBS) $(LTHREAD_LIBS)
SYMBOL_VERSION_FLAGS=$(OL_VERSIONED_SYMBOLS)$(srcdir)/ldap.map

apitest:	$(XLIBS) apitest.o
	$(LTLINK) -o $@ apitest.o $(LIBS)
dntest:	$(XLIBS) dntest.o
	$(LTLINK) -o $@ dntest.o $(LIBS)
ftest:	$(XLIBS) ftest.o
	$(LTLINK) -o $@ ftest.o $(LIBS)
ltest:	$(XLIBS) test.o
	$(LTLINK) -o $@ test.o $(LIBS)
testavl: $(XLIBS) testavl.o
	$(LTLINK) -o $@ testavl.o $(LIBS)
testtavl: $(XLIBS) testtavl.o
	$(LTLINK) -o $@ testtavl.o $(LIBS)
urltest: $(XLIBS) urltest.o
	$(LTLINK) -o $@ urltest.o $(LIBS)


CFFILES=ldap.conf

install-local: $(CFFILES) FORCE
	-$(MKDIR) $(DESTDIR)$(libdir)
	$(LTINSTALL) $(INSTALLFLAGS) -m 644 $(LIBRARY) $(DESTDIR)$(libdir)
	$(LTFINISH) $(DESTDIR)$(libdir)
	-$(MKDIR) $(DESTDIR)$(sysconfdir)
	@for i in $(CFFILES); do \
		if test ! -f $(DESTDIR)$(sysconfdir)/$$i; then \
			echo "installing $$i in $(sysconfdir)"; \
			echo "$(INSTALL) $(INSTALLFLAGS) -m 644  $(srcdir)/$$i $(DESTDIR)$(sysconfdir)/$$i"; \
			$(INSTALL) $(INSTALLFLAGS) -m 644 $(srcdir)/$$i $(DESTDIR)$(sysconfdir)/$$i; \
		else \
			echo "PRESERVING EXISTING CONFIGURATION FILE $(sysconfdir)/$$i" ; \
		fi; \
		$(INSTALL) $(INSTALLFLAGS) -m 644 $(srcdir)/$$i $(DESTDIR)$(sysconfdir)/$$i.default; \
	done

# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2022 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.
##---------------------------------------------------------------------------
#
# Makefile Template for Libraries
#

all-common: $(LIBRARY) $(PROGRAMS)

version.c: Makefile
	$(RM) $@
	$(MKVERSION) $(LIBRARY) > $@

version.o version.lo: version.c $(OBJS)

install-common: FORCE

lint: lint-local FORCE
	$(LINT) $(DEFS) $(DEFINES) $(SRCS)

lint5: lint5-local FORCE
	$(5LINT) $(DEFS) $(DEFINES) $(SRCS)

#
# In the mingw/cygwin environment, the so and dll files must be
# deleted separately, instead of using the {.so*,*.dll} construct
# that was previously used. It just didn't work.
#
clean-common: 	FORCE
	$(RM) $(LIBRARY) ../$(LIBRARY) $(XLIBRARY) \
		$(PROGRAMS) $(XPROGRAMS) $(XSRCS) $(XXSRCS) \
		*.o *.lo a.out *.exe core version.c .libs/*

depend-common: FORCE
	$(MKDEP) $(DEFS) $(DEFINES) $(SRCS) $(XXSRCS)

lint-local: FORCE
lint5-local: FORCE

Makefile: $(top_srcdir)/build/lib.mk

# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 1998-2022 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.
##---------------------------------------------------------------------------
#
# Makefile Template for Shared Libraries
#

MKDEPFLAG = -l

.SUFFIXES: .c .o .lo

.c.lo:
	$(LTCOMPILE_LIB) $<

$(LIBRARY): version.lo
	$(LTLINK_LIB) -o $@ $(OBJS) version.lo $(LINK_LIBS)

Makefile: $(top_srcdir)/build/lib-shared.mk

