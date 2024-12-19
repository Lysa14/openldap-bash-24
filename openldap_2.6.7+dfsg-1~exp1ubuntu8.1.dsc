Format: 3.0 (quilt)
Source: openldap
Binary: slapd, slapd-contrib, slapd-smbk5pwd, ldap-utils, libldap2, libldap-common, libldap-dev, libldap2-dev, slapi-dev
Architecture: any all
Version: 2.6.7+dfsg-1~exp1ubuntu8.1
Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
Uploaders: Steve Langasek <vorlon@debian.org>, Torsten Landschoff <torsten@debian.org>, Ryan Tandy <ryan@nardis.ca>, Sergio Durigan Junior <sergiodj@debian.org>
Homepage: https://www.openldap.org/
Standards-Version: 4.6.2
Vcs-Browser: https://salsa.debian.org/openldap-team/openldap
Vcs-Git: https://salsa.debian.org/openldap-team/openldap.git
Testsuite: autopkgtest
Testsuite-Triggers: heimdal-kdc, openssl, samba, schema2ldif, ssl-cert
Build-Depends: debhelper-compat (= 13), dh-apparmor, dpkg-dev (>= 1.17.14), groff-base, heimdal-multidev (>= 7.4.0.dfsg.1-1~) <!pkg.openldap.noslapd>, libargon2-dev <!pkg.openldap.noslapd>, libgnutls28-dev, libltdl-dev <!pkg.openldap.noslapd>, libperl-dev (>= 5.8.0) <!pkg.openldap.noslapd>, libsasl2-dev, libwrap0-dev <!pkg.openldap.noslapd>, nettle-dev <!pkg.openldap.noslapd>, openssl <!nocheck>, perl:any, pkg-config (>= 0.29), po-debconf, unixodbc-dev <!pkg.openldap.noslapd>, krb5-admin-server <!nocheck>, krb5-user <!nocheck>, krb5-kdc <!nocheck>, libsasl2-modules-gssapi-mit <!nocheck>, sasl2-bin <!nocheck>
Build-Conflicts: autoconf2.13, bind-dev, libbind-dev
Package-List:
 ldap-utils deb net optional arch=any
 libldap-common deb libs optional arch=all
 libldap-dev deb libdevel optional arch=any
 libldap2 deb libs optional arch=any
 libldap2-dev deb oldlibs optional arch=all
 slapd deb net optional arch=any profile=!pkg.openldap.noslapd
 slapd-contrib deb net optional arch=any profile=!pkg.openldap.noslapd
 slapd-smbk5pwd deb oldlibs optional arch=all profile=!pkg.openldap.noslapd
 slapi-dev deb libdevel optional arch=any profile=!pkg.openldap.noslapd
Checksums-Sha1:
 80f065b81f691416ea376e10d25ecab3b9e39fb1 3774648 openldap_2.6.7+dfsg.orig.tar.xz
 e50a5a9158be06ace150c0651ea8a9c7152622a5 186656 openldap_2.6.7+dfsg-1~exp1ubuntu8.1.debian.tar.xz
Checksums-Sha256:
 ac9e26700ff8dd10181944d3e61014df5e3db601dd05655966be46757710d6df 3774648 openldap_2.6.7+dfsg.orig.tar.xz
 a0a3c8b28cae38ff0e791707922e368840dec708e5a652f3a82ee3f37f9f9705 186656 openldap_2.6.7+dfsg-1~exp1ubuntu8.1.debian.tar.xz
Files:
 36c0542618d106ebef1c15e58b2d80ca 3774648 openldap_2.6.7+dfsg.orig.tar.xz
 1b7773da4130a4cee47781a6702a85d7 186656 openldap_2.6.7+dfsg-1~exp1ubuntu8.1.debian.tar.xz
Original-Maintainer: Debian OpenLDAP Maintainers <pkg-openldap-devel@lists.alioth.debian.org>
