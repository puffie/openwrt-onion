PKG_DRIVERS += \
		nrc7292

define KernelPackage/nrc7292
  $(call KernelPackage/mac80211/Default)
  TITLE:=Newracom 802.11ah Wi-Fi halow driver
#  DEPENDS+= @TARGET_bcm27xx:kmod-spi-bcm2835 +kmod-mac80211
  DEPENDS+= +TARGET_bcm27xx:kmod-spi-bcm2835 +kmod-mac80211
  FILES:=$(PKG_BUILD_DIR)/drivers/net/wireless/newracom/nrc7292/nrc7292.ko
  AUTOLOAD:=$(call AutoProbe,nrc7292)
endef
config-y += WLAN_VENDOR_NEWRACOM

config-$(call config_package,nrc7292) += NRC7292

define KernelPackage/nrc7292/install
	$(INSTALL_DIR) $(1)/lib/firmware
	$(INSTALL_DATA) $(PKG_BUILD_DIR)/drivers/net/wireless/newracom/nrc7292/firmware/* $(1)/lib/firmware
endef
