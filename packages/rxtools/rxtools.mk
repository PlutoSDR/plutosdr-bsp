################################################################################
#
# RXTOOLS
#
################################################################################
RXTOOLS_VERSION = 571cc9aeccb2004d81032cea484324aacb1a5852
RXTOOLS_SITE = https://github.com/rxseger/rx_tools.git
RXTOOLS_SITE_METHOD = git

RXTOOLS_INSTALL_STAGING = YES
RXTOOLS_LICENSE = GPL-2.0
RXTOOLS_LICENSE_FILES =  COPYING
RXTOOLS_DEPENDENCIES = soapysdr


$(eval $(cmake-package))
