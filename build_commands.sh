#! /bin/bash

rm -rf .repo/local_manifests; \

repo init -u https://github.com/crdroidandroid/android.git -b 15.0 --git-lfs

rm -rf prebuilts/clang/host/linux-x86; \

/opt/crave/resync.sh; \

rm -rf out/target/product/munch; \
rm -rf device/xiaomi/munch; \
rm -rf device/xiaomi/sm8250-common; \
rm -rf kernel/xiaomi/munch; \
rm -rf vendor/xiaomi/munch; \
rm -rf vendor/xiaomi/munch-firmware; \
rm -rf hardware/xiaomi; \
rm -rf hardware/dolby; \
rm -rf vendor/xiaomi/miuicamera; \
rm -rf packages/resources/devicesettings; \

# Device Tree
git clone https://github.com/Efeisot/android_device_xiaomi_munch -b crdroid device/xiaomi/munch; \

# Device Common
git clone https://github.com/Efeisot/android_device_xiaomi_sm8250-common device/xiaomi/sm8250-common; \

# Munch Vendor
git clone https://gitlab.com/rik-x777/vendor_xiaomi_munch vendor/xiaomi/munch; \

# Munch Firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel
#git clone https://github.com/SenseiiX/fusionX_sm8250 -b exp-nxt kernel/xiaomi/munch; \
git clone https://github.com/munch-devs/kernel_xiaomi_munch -b munch-ksu kernel/xiaomi/munch; \

# Hardware Xiaomi
#git clone https://github.com/SenseiiX/android_hardware_xiaomi hardware/xiaomi; \
git clone https://github.com/LineageOS/android_hardware_xiaomi hardware/xiaomi; \

# Hardware Dolby
git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

# Device Settings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# Miui Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \

. build/envsetup.sh; \
brunch munch; \
