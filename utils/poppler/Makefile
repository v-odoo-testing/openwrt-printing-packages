#
# Copyright (C) 2013 OpenWrt.org
#
# This is free software, licensed under the GNU General Public License v2.
# See /LICENSE for more information.
#

include $(TOPDIR)/rules.mk
include $(INCLUDE_DIR)/nls.mk

PKG_NAME:=poppler
PKG_VERSION:=23.11.0
PKG_RELEASE:=1

PKG_SOURCE:=$(PKG_NAME)-$(PKG_VERSION).tar.xz
PKG_SOURCE_URL:=http://poppler.freedesktop.org/
PKG_MD5SUM:=145a45e20872d3920bb70cb3efd85231

PKG_INSTALL:=1

include $(INCLUDE_DIR)/package.mk
include $(INCLUDE_DIR)/cmake.mk

define Package/poppler
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Poppler PDF rendering library
  DEPENDS:=+libpng +libtiff +libjpeg +zlib +lcms2 +fontconfig +libpthread +libfreetype +libstdcpp +libcairo +glib2 +libintl-full +curl +libnss +nspr
  URL:=http://poppler.freedesktop.org/
  SUBMENU:=Printing
endef

define Package/poppler/description
	Poppler is a PDF rendering library based on the xpdf-3.0 code base.
endef

CMAKE_OPTIONS += \
	-DENABLE_GLIB=OFF \
	-DENABLE_GTK_DOC=OFF \
	-DBUILD_GTK_TESTS=OFF \
	-DENABLE_QT5=OFF \
	-DENABLE_QT6=OFF \
	-DBUILD_QT5_TESTS=OFF \
	-DBUILD_QT6_TESTS=OFF \
	-DENABLE_CPP=OFF \
	-DENABLE_ZLIB_UNCOMPRESS=ON \
	-DENABLE_LIBOPENJPEG=none \
	-DENABLE_DCTDECODER=libjpeg \
	-DENABLE_GPGME=OFF \
	-DUSE_CMS=lcms2 \
	-DFONT_CONFIGURATION=fontconfig

define Package/poppler/install
	$(INSTALL_DIR) $(1)/usr/bin $(1)/usr/lib
	$(INSTALL_BIN) $(PKG_INSTALL_DIR)/usr/bin/* $(1)/usr/bin/
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib/
endef

define Build/InstallDev
	$(INSTALL_DIR) $(1)/usr/include/cpp $(1)/usr/lib
#	$(CP) -r $(PKG_INSTALL_DIR)/usr/include/poppler $(1)/usr/include/
#	$(CP) -r $(PKG_BUILD_DIR)/cpp/poppler-version.h $(1)/usr/include/cpp
	$(CP) -r $(PKG_BUILD_DIR)/cpp/poppler-global.h $(1)/usr/include/cpp
	$(CP) $(PKG_INSTALL_DIR)/usr/lib/* $(1)/usr/lib
endef

$(eval $(call BuildPackage,poppler))
