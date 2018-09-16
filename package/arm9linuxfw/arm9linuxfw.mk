################################################################################
#
# arm9linuxfw
#
################################################################################
ARM9LINUXFW_VERSION = 32f88e9106efe9d03dd4fe960a801be75d563f61
ARM9LINUXFW_SITE = $(call github,xerpi,arm9linuxfw,$(ARM9LINUXFW_VERSION))
ARM9LINUXFW_LICENSE = GPLv2
ARM9LINUXFW_LICENSE_FILES = license.txt

define ARM9LINUXFW_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define ARM9LINUXFW_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arm9linuxfw-master.bin $(BINARIES_DIR)/arm9linuxfw-master.bin
endef

$(eval $(generic-package))
