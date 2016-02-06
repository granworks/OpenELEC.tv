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

PKG_NAME="emby"
PKG_VERSION="3.0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OSS"
PKG_SITE="http://emby.media"
PKG_URL="https://github.com/MediaBrowser/Emby.Releases/raw/master/Server/Emby.Mono.zip"
PKG_DEPENDS_TARGET="toolchain ImageMagick sqlite mono"
PKG_PRIORITY="optional"
PKG_SECTION="mediacenter"
PKG_SHORTDESC=".NET based streaming server"
PKG_LONGDESC="Bring together your videos, music, photos, and live televsion"

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

unpack() {
  mkdir -p $BUILD/$PKG_NAME-$PKG_VERSION
  $SCRIPTS/extract $PKG_NAME "Emby.Mono.zip" $BUILD/$PKG_NAME-$PKG_VERSION
}

make_target() {
  mkdir -p $INSTALL;
}

makeinstall_target() {
  mkdir -p $INSTALL/opt;
  cp -a emby $INSTALL/opt/

  sed -e "s,libMagickWand-6.Q8.so,/usr/lib/libMagickWand-6.Q8.so,g" -i $INSTALL/opt/emby/ImageMagickSharp.dll.config
  sed -e "s,libsqlite3.so,/usr/lib/libsqlite3.so,g" -i $INSTALL/opt/emby/System.Data.SQLite.dll.config
}

post_install() {
  enable_service emby.service
}
