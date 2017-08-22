################################################################################
#
# libad9361-iio
#
################################################################################
LIBAD9361_IIO_VERSION = 6027674bc2ef400147f1607d0252e5347163f2f7
LIBAD9361_IIO_SITE = https://github.com/analogdevicesinc/libad9361-iio
LIBAD9361_IIO_SITE_METHOD = git

LIBAD9361_IIO_INSTALL_STAGING = YES
LIBAD9361_IIO_LICENSE = LGPL-2.1+
LIBAD9361_IIO_LICENSE_FILE = LICENSE


$(eval $(cmake-package))
