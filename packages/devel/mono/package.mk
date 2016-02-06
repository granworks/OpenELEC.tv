################################################################################
#      This file is part of OpenELEC - http://www.openelec.tv
#      Copyright (C) 2009-2016 Stephan Raue (stephan@openelec.tv)
#
#  OpenELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  OpenELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with OpenELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="mono"
PKG_VERSION="4.2.2.30-2"
PKG_REV="1"
PKG_ARCH="x86_64"
PKG_LICENSE="OSS"
PKG_SITE="http://www.mono-project.com"
PKG_URL="http://mirror.de.leaseweb.net/archlinux/extra/os/x86_64/$PKG_NAME-$PKG_VERSION-$PKG_ARCH.pkg.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="Free implementation of the .NET platform including runtime and compiler"
PKG_LONGDESC="The Mono runtime implements a JIT engine for the ECMA CLI virtual machine (as well as a byte code interpreter, the class loader, the garbage collector, threading system and metadata access libraries."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $BUILD/$PKG_NAME-$PKG_VERSION
  $SCRIPTS/extract $PKG_NAME "$PKG_NAME*.tar.xz" $BUILD/$PKG_NAME-$PKG_VERSION
}

make_target() {
  mkdir -p $INSTALL;
}

makeinstall_target() {
  cp -a usr $INSTALL/
  cp -a etc $INSTALL/
}
