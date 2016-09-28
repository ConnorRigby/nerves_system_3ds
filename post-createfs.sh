#!/bin/sh

set -e

FWUP_CONFIG=$NERVES_DEFCONFIG_DIR/fwup.conf
GEN_INITRAMFS=$NERVES_DEFCONFIG_DIR/gen_initramfs_list.sh
# Run the common post-image processing for nerves
$BR2_EXTERNAL/board/nerves-common/post-createfs.sh $TARGET_DIR $FWUP_CONFIG
cd $BINARIES_DIR
rm -rf squashfs-root
unsquashfs rootfs.squashfs
cd squashfs-root/ && find . | cpio --quiet -o -H newc > ../beep.cpio
