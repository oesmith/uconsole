# Linux kernel patch for ClockworkPi uConsole

This folder contains patches that can be applied to upstream Raspberry Pi
kernel sources to add hardware support for uConsole hardware.

These patches are based on the patched kernel repo source available at
https://github.com/ak-rex/clockworkpi-linux.

Huge thanks to ak-rex for doing the hard lifting of assembling these changes in
the first place and making them available to the community.

## Instructions to build a kernel

This will generate `linux-headers-$version-v8+` and `linux-image-$version-v8+`
deb packages that can be installed on a Debian-based system.

1. Clone the Raspberry Pi kernel sources

    git clone --depth=1 https://github.com/raspberrypi/linux.git rpi-linux
    cd rpi-linux

2. Apply the patch (insert the path to correct patch for the kernel version)

    patch -p1 < path/to/clockworkpi-kernel.patch

3. Set environment variables (remove the cross compile vars if not needed)

    export KERNEL=kernel8
    export ARCH=arm64
    export CROSS_COMPILE=aarch64-linux-gnu-

4. Generate a config

    make bcm2711_defconfig

5. Build a kernel package

    make -j4 bindeb-pkg
