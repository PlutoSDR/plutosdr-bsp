################################################################################
#
# dump1090
#
################################################################################
DUMP1090_VERSION = master
DUMP1090_SITE = https://github.com/PlutoSDR/dump1090.git
DUMP1090_SITE_METHOD = git

DUMP1090_LICENSE = BSD-3c
DUMP1090_LICENSE_FILES = COPYING
DUMP1090_DEPENDENCIES = libiio libad9361-iio

define DUMP1090_BUILD_CMDS
    $(MAKE) CC="$(TARGET_CC)" LD="$(TARGET_LD)" -C $(@D) all
endef

define DUMP1090_INSTALL_TARGET_CMDS
    $(INSTALL) -D -m 0755 $(@D)/dump1090 $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
