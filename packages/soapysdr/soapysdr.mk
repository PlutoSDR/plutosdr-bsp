################################################################################
#
# soapysdr
#
################################################################################
SOAPYSDR_VERSION = 0.6.0
SOAPYSDR_SOURCE = soapy-sdr-$(SOAPYSDR_VERSION).tar.gz
SOAPYSDR_SITE = https://github.com/pothosware/SoapySDR/archive
SOAPYSDR_INSTALL_STAGING = YES
SOAPYSDR_LICENSE = Boost Software License 1.0
SOAPYSDR_LICENSE_FILES = LICENSE_1_0.txt
SOAPYSDR_CONF_OPTS = -DENABLE_PYTHON=OFF
$(eval $(cmake-package))
