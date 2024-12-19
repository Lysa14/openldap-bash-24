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

top_builddir = ../../..

srcdir = ../../../../../servers/slapd/overlays
top_srcdir = ../../../../..
VPATH = ../../../../../servers/slapd/overlays
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

# Makefile.in for overlays
# $OpenLDAP$
## This work is part of OpenLDAP Software <http://www.openldap.org/>.
##
## Copyright 2003-2022 The OpenLDAP Foundation.
## All rights reserved.
##
## Redistribution and use in source and binary forms, with or without
## modification, are permitted only as authorized by the OpenLDAP
## Public License.
##
## A copy of this license is available in the file LICENSE in the
## top-level directory of the distribution or, alternatively, at
## <http://www.OpenLDAP.org/license.html>.

SRCS = overlays.c \
	accesslog.c \
	auditlog.c \
	autoca.c \
	constraint.c \
	dds.c \
	deref.c \
	dyngroup.c \
	dynlist.c \
	homedir.c \
	memberof.c \
	otp.c \
	pcache.c \
	collect.c \
	ppolicy.c \
	refint.c \
	remoteauth.c \
	retcode.c \
	rwm.c rwmconf.c rwmdn.c rwmmap.c \
	seqmod.c \
	sssvlv.c \
	syncprov.c \
	translucent.c \
	unique.c \
	valsort.c
OBJS = statover.o \
	 \
	overlays.o

# Add here the objs that are needed by overlays, but do not make it
# into SLAPD_STATIC_OVERLAYS...
OBJDEP=rwm.o rwmconf.o rwmdn.o rwmmap.o

LTONLY_MOD = $(LTONLY_mod)
LDAP_INCDIR= ../../../include       
LDAP_LIBDIR= ../../../libraries

MOD_DEFS = -DSLAPD_IMPORT

shared_LDAP_LIBS = $(LDAP_LIBLDAP_LA) $(LDAP_LIBLBER_LA)
NT_LINK_LIBS = -L.. -lslapd $(shared_LDAP_LIBS)
UNIX_LINK_LIBS = $(shared_LDAP_LIBS)

LIBRARY = ../liboverlays.a
PROGRAMS =  accesslog.la auditlog.la collect.la constraint.la dds.la deref.la dyngroup.la dynlist.la homedir.la memberof.la otp.la ppolicy.la pcache.la refint.la remoteauth.la retcode.la rwm.la seqmod.la sssvlv.la syncprov.la translucent.la unique.la valsort.la

XINCPATH = -I.. -I$(srcdir)/..
XDEFS = $(MODULES_CPPFLAGS)

static:	$(LIBRARY)

dynamic: $(PROGRAMS)

accesslog.la : accesslog.lo
	$(LTLINK_MOD) -module -o $@ accesslog.lo version.lo $(LINK_LIBS)

auditlog.la : auditlog.lo
	$(LTLINK_MOD) -module -o $@ auditlog.lo version.lo $(LINK_LIBS)

autoca.la : autoca.lo
	$(LTLINK_MOD) -module -o $@ autoca.lo version.lo $(LINK_LIBS)

constraint.la : constraint.lo
	$(LTLINK_MOD) -module -o $@ constraint.lo version.lo $(LINK_LIBS)

dds.la : dds.lo
	$(LTLINK_MOD) -module -o $@ dds.lo version.lo $(LINK_LIBS)

deref.la : deref.lo
	$(LTLINK_MOD) -module -o $@ deref.lo version.lo $(LINK_LIBS)

dyngroup.la : dyngroup.lo
	$(LTLINK_MOD) -module -o $@ dyngroup.lo version.lo $(LINK_LIBS)

dynlist.la : dynlist.lo
	$(LTLINK_MOD) -module -o $@ dynlist.lo version.lo $(LINK_LIBS)

homedir.la : homedir.lo
	$(LTLINK_MOD) -module -o $@ homedir.lo version.lo $(LINK_LIBS)

memberof.la : memberof.lo
	$(LTLINK_MOD) -module -o $@ memberof.lo version.lo $(LINK_LIBS)

otp.la : otp.lo
	$(LTLINK_MOD) -module -o $@ otp.lo version.lo $(LINK_LIBS)

pcache.la : pcache.lo
	$(LTLINK_MOD) -module -o $@ pcache.lo version.lo $(LINK_LIBS)

collect.la : collect.lo
	$(LTLINK_MOD) -module -o $@ collect.lo version.lo $(LINK_LIBS)

ppolicy.la : ppolicy.lo
	$(LTLINK_MOD) -module -o $@ ppolicy.lo version.lo $(LINK_LIBS) $(MODULES_LIBS)

refint.la : refint.lo
	$(LTLINK_MOD) -module -o $@ refint.lo version.lo $(LINK_LIBS)

remoteauth.la : remoteauth.lo
	$(LTLINK_MOD) -module -o $@ remoteauth.lo version.lo $(LINK_LIBS)

retcode.la : retcode.lo
	$(LTLINK_MOD) -module -o $@ retcode.lo version.lo $(LINK_LIBS)

rwm_x.o: rwm.o rwmconf.o rwmdn.o rwmmap.o
	$(LD) -r -o $@ rwm.o rwmconf.o rwmdn.o rwmmap.o

rwm.la : rwm.lo rwmconf.lo rwmdn.lo rwmmap.lo
	$(LTLINK_MOD) -module -o $@ rwm.lo rwmconf.lo rwmdn.lo rwmmap.lo version.lo $(LINK_LIBS)

seqmod.la : seqmod.lo
	$(LTLINK_MOD) -module -o $@ seqmod.lo version.lo $(LINK_LIBS)

sssvlv.la : sssvlv.lo
	$(LTLINK_MOD) -module -o $@ sssvlv.lo version.lo $(LINK_LIBS)

syncprov.la : syncprov.lo
	$(LTLINK_MOD) -module -o $@ syncprov.lo version.lo $(LINK_LIBS)

translucent.la : translucent.lo
	$(LTLINK_MOD) -module -o $@ translucent.lo version.lo $(LINK_LIBS)

unique.la : unique.lo
	$(LTLINK_MOD) -module -o $@ unique.lo version.lo $(LINK_LIBS)

valsort.la : valsort.lo
	$(LTLINK_MOD) -module -o $@ valsort.lo version.lo $(LINK_LIBS)

install-local:	$(PROGRAMS)
	@if test -n "$?" ; then \
		$(MKDIR) $(DESTDIR)$(moduledir); \
		$(LTINSTALL) $(INSTALLFLAGS) -m 755 $? $(DESTDIR)$(moduledir);\
	fi

MKDEPFLAG = -l

.SUFFIXES: .c .o .lo

.c.lo:
	$(LTCOMPILE_MOD) $<

statover.o: statover.c $(srcdir)/../slap.h

$(LIBRARY): $(OBJS) version.lo
	$(AR) rs $@ $(OBJS)

# Must fixup depends for non-libtool objects
depend-local: depend-common
	@if test -n "$(OBJS)"; then \
	OBJ2=`echo $(OBJS) $(OBJDEP) | $(SED) -e 's/\.o//g'`; \
	SCR=''; for i in $$OBJ2; do SCR="$$SCR -e s/^$$i.lo:/$$i.o:/"; done; \
	mv Makefile Makefile.bak; $(SED) $$SCR Makefile.bak > Makefile && \
	$(RM) Makefile.bak; fi

veryclean-local:
	$(RM) statover.c

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

