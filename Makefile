all: clean build

clean:
	# clean up src
	cd src && \
	git checkout . && \
	git clean -df

build:
	# apply arch patches
	#patch -d src -p1 -i "../patches/archlinux/fix_310_proc2.patch"
	patch -d src -p1 -i "../patches/archlinux/N150MA.patch"
	patch -d src -p1 -i "../patches/archlinux/NoDebug.patch"
	patch -d src -p1 -i "../patches/archlinux/ISY.patch"
	patch -d src -p1 -i "../patches/archlinux/D-link.patch"
	patch -d src -p1 -i "../patches/archlinux/HWNUM-300V2.patch"
	#patch -d src -p1 -i "../patches/archlinux/RTL8192CU-kernel-4.0.patch"
	
	# apply misc patches
	patch -d src -p1 -i "../patches/enable_CONFIG_NO_WIRELESS_HANDLERS.patch"
	patch -d src -p1 -i "../patches/disable_CONFIG_POWER_SAVING.patch"
	
	# make module
	make -C src
