################################################################################
#
# SoapyPlutSDR
#
################################################################################
SOAPYPLUTOSDR_VERSION = master
SOAPYPLUTOSDR_SITE = https://github.com/jocover/SoapyPlutoSDR.git
SOAPYPLUTOSDR_SITE_METHOD = git

SOAPYPLUTOSDR_INSTALL_STAGING = YES
SOAPYPLUTOSDR_LICENSE = LGPL-2.1+
SOAPYPLUTOSDR_LICENSE_FILE = LICENSE
SOAPYPLUTOSDR_DEPENDENCIES = libiio libad9361-iio soapysdr

$(eval $(cmake-package))
