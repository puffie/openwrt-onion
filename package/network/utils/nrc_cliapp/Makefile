include $(TOPDIR)/rules.mk

PKG_NAME:=cli_app
PKG_RELEASE:=1
PKG_LICENSE:=Apache-2.0

include $(INCLUDE_DIR)/package.mk


define Package/cli_app
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Client App to control nrc7292 Wifi Module
  MAINTAINER:=newracom
endef

define Package/cli_app/description
  Control nrc7292 wifi module using netlink
endef


define Build/Configure
endef

define Build/Compile
	$(TARGET_CC) $(TARGET_CFLAGS) \
		-o $(PKG_BUILD_DIR)/cli_app \
		$(PKG_BUILD_DIR)/cli_cmd.c \
		$(PKG_BUILD_DIR)/cli_netlink.c \
		$(PKG_BUILD_DIR)/cli_util.c \
		$(PKG_BUILD_DIR)/main.c
endef


define Package/cli_app/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/cli_app $(1)/usr/bin/cli_app
endef

$(eval $(call BuildPackage,cli_app))
