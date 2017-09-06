################################################################################
#
# arm9linuxfw
#
################################################################################
ARM9LINUXFW_VERSION = master
ARM9LINUXFW_SITE_METHOD = git
ARM9LINUXFW_SITE = ssh://git@github.com/xerpi/arm9linuxfw.git
ARM9LINUXFW_LICENSE = GPLv2
ARM9LINUXFW_LICENSE_FILES = license.txt

define ARM9LINUXFW_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define ARM9LINUXFW_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/arm9linuxfw-master.bin $(BINARIES_DIR)/arm9linuxfw-master.bin
endef

$(eval $(generic-package))
