#! /bin/bash

rm -rf .repo/local_manifests
repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs

rm -rf prebuilts/clang/host/linux-x86

git clone https://github.com/SenseiiX/local_manifest --depth 1 -b lunaris .repo/local_manifests

/opt/crave/resync.sh 

# ======CLEAN BUILD=======
rm -rf out/target/product/munch
#rm -rf device/xiaomi/munch
#rm -rf kernel/xiaomi/munch
#rm -rf vendor/xiaomi/munch
#rm -rf vendor/xiaomi/munch-firmware
#rm -rf hardware/xiaomi
#rm -rf hardware/dolby
#rm -rf vendor/xiaomi/miuicamera

# ======CLEAN BUILD=======
#git clone https://github.com/SenseiiX/android_device_xiaomi_munch -b lunaris device/xiaomi/munch
#git clone https://github.com/munch-devs/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch
#git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware
#git clone https://github.com/munch-devs/kernel_xiaomi_munch -b munch-ksu kernel/xiaomi/munch
#git clone https://github.com/munch-devs/android_hardware_xiaomi hardware/xiaomi
#git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby
#git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings
#git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera

# Device Settings
rm -rf packages/resources/devicesettings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings --depth 1 -b aosop-16 packages/resources/devicesettings

# Settings App
rm -rf packages/apps/Settings
git clone https://github.com/SenseiiX/packages_apps_Settings --depth 1 -b 16 packages/apps/Settings

. build/envsetup.sh
lunch lineage_munch-bp2a-user
m lunaris
