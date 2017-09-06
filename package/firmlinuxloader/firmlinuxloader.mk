################################################################################
#
# firmlinuxloader
#
################################################################################
FIRMLINUXLOADER_VERSION = master
FIRMLINUXLOADER_SITE_METHOD = git
FIRMLINUXLOADER_SITE = ssh://git@github.com/xerpi/firm_linux_loader.git
FIRMLINUXLOADER_LICENSE = GPLv2
FIRMLINUXLOADER_LICENSE_FILES = license.txt

define FIRMLINUXLOADER_BUILD_CMDS
	$(MAKE) -C $(@D)
endef

define FIRMLINUXLOADER_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/firm_linux_loader.firm $(BINARIES_DIR)/firm_linux_loader.firm
endef

$(eval $(generic-package))
