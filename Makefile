include $(TOPDIR)/rules.mk

PKG_NAME:=quickroute
PKG_VERSION:=1.23.8
PKG_HASH:=594b20c6cd9c4ab2f15e37e074bd28d3d7a0e7622627b1b11072576de84eafd7
PKG_RELEASE:=1
PKG_BUILD_PARALLEL:=1
PKG_LICENSE:=LGPL-2.1

PKG_SOURCE:=$(PKG_VERSION).tar.gz
PKG_SOURCE_URL:= https://github.com/flakeforever/quickroute/archive/refs/tags/

include $(INCLUDE_DIR)/package.mk

define Package/quickroute
    SECTION:=utils
    CATEGORY:=Utilities
    TITLE:=A quick routing configuration tool
    DEPENDS:=+libstdcpp +libuci +ipset +iptables +ip-full
endef

define Package/quickroute/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/quickroute $(1)/usr/sbin/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_DATA) ./etc/config/quickroute $(1)/etc/config/
	$(INSTALL_DIR) $(1)/etc/init.d
	$(INSTALL_BIN) ./etc/init.d/quickroute $(1)/etc/init.d/
endef

$(eval $(call BuildPackage,quickroute))
