CROSS_COMPILE ?= arm-xilinx-linux-gnueabi-
NCORES = $(shell grep -c ^processor /proc/cpuinfo)
DEPS_FILENAME = plutosdr_deps_v0.22.zip

ifeq (, $(shell which dfu-suffix))
$(warning "No dfu-utils in PATH consider doing: sudo apt-get install dfu-util")
TARGETS = build/pluto.frm
else
TARGETS = build/pluto.dfu build/pluto.frm
endif

all: $(TARGETS)


build:
	mkdir -p $@

%: build/%
	cp $< $@

### Linux ###

#linux/arch/arm/boot/zImage:
#	make -C linux ARCH=arm zynq_pluto_defconfig
#	make -C linux -j $(NCORES) ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) zImage UIMAGE_LOADADDR=0x8000

#.PHONY: linux/arch/arm/boot/zImage


#build/zImage: linux/arch/arm/boot/zImage  | build
#	cp $< $@

### Buildroot ###

buildroot/output/images/rootfs.cpio.gz:
	cp -f build/VERSIONS buildroot/board/pluto
	echo buildroot $(shell git describe --abbrev=4 --dirty --always --tags)>> $(CURDIR)/buildroot/board/pluto/VERSIONS
	make -C buildroot ARCH=arm zynq_pluto_defconfig
	make -C buildroot TOOLCHAIN_EXTERNAL_INSTALL_DIR= ARCH=arm CROSS_COMPILE=$(CROSS_COMPILE) BUSYBOX_CONFIG_FILE=$(CURDIR)/buildroot/board/pluto/busybox-1.25.0.config all

.PHONY: buildroot/output/images/rootfs.cpio.gz

build/rootfs.cpio.gz: buildroot/output/images/rootfs.cpio.gz | build
	cp $< $@

build/pluto.itb: build/zImage build/rootfs.cpio.gz build/zynq-pluto-sdr.dtb build/zynq-pluto-sdr-revb.dtb build/system_top.bit
	mkimage -f scripts/pluto.its $@

### MSD update firmware file ###

build/pluto.frm: build/pluto.itb
	md5sum $< | cut -d ' ' -f 1 > $@.md5
	cat $< $@.md5 > $@

build/pluto.dfu: build/pluto.itb
	cp $< $<.tmp
	dfu-suffix -a $<.tmp -v 0x0456 -p 0xb673
	mv $<.tmp $@


clean:
	make -C buildroot clean
	rm -f $(notdir $(wildcard build/*))
	rm -rf build/*

dfu-pluto: build/pluto.dfu
	dfu-util -D build/pluto.dfu -a firmware.dfu
	dfu-util -e

dfu-ram: build/pluto.dfu
	sshpass -p analog ssh root@pluto '/usr/sbin/device_reboot ram;'
	sleep 5
	dfu-util -D build/pluto.dfu -a firmware.dfu
	dfu-util -e

update-deps:
	wget https://www.plutosdr.com/downloads/${DEPS_FILENAME}
	unzip -o -d build ${DEPS_FILENAME}
	rm ${DEPS_FILENAME}

update-buildroot-config:
	cp -f zynq_pluto_defconfig buildroot/configs/zynq_pluto_defconfig

update-buildroot-packages:
	cp -Rf packages/* buildroot/package/ 

update:update-deps update-buildroot-config update-buildroot-packages

git-update-all:
	git submodule init
	git submodule update --recursive --remote

git-pull:
	git pull --recurse-submodules
