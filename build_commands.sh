#! /bin/bash

rm -rf .repo/local_manifests; \

repo init -u https://github.com/Lunaris-AOSP/android -b 16 --git-lfs; \

rm -rf prebuilts/clang/host/linux-x86; \

/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \

# Device Tree
git clone https://github.com/SenseiiX/android_device_xiaomi_munch -b lunaris device/xiaomi/munch; \

# Munch Vendor
git clone https://github.com/munch-devs/android_vendor_xiaomi_munch -b 16 vendor/xiaomi/munch; \

# Munch Firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel (N0kernel / FusionX)
git clone https://github.com/SenseiiX/fusionX_sm8250 -b wip-next kernel/xiaomi/munch; \
#git clone https://github.com/munch-devs/kernel_xiaomi_munch -b munch-ksu kernel/xiaomi/munch; \

# Hardware Xiaomi
git clone https://github.com/SenseiiX/android_hardware_xiaomi -b 16 hardware/xiaomi; \

# Hardware Dolby
git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

# Device Settings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings -b aosp-16 packages/resources/devicesettings; \

# MiCam
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

# Settings App
rm -rf packages/apps/Settings
git clone https://github.com/SenseiiX/packages_apps_Settings --depth 1 -b 16 packages/apps/Settings

. build/envsetup.sh
lunch lineage_munch-bp2a-user
m lunaris
