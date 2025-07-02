#! /bin/bash

rm -rf .repo/local_manifests; \

#repo init -u https://github.com/crdroidandroid/android -b 15.0 --git-lfs; \
#repo init -u https://github.com/RisingOS-Revived/android -b qpr2 --git-lfs; \
#repo init -u https://github.com/ProjectInfinity-X/manifest -b 15 --git-lfs; \
#repo init -u https://github.com/ProjectMatrixx/android -b 15.0 --git-lfs; \
repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs; \

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
#git clone https://github.com/SenseiiX/android_device_xiaomi_munch device/xiaomi/munch; \
git clone https://github.com/SenseiiX/android_device_xiaomi_munch -b v-axion device/xiaomi/munch; \

# Munch Vendor
git clone https://github.com/SenseiiX/android_vendor_xiaomi_munch vendor/xiaomi/munch; \

# Munch Firmware
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_munch-firmware vendor/xiaomi/munch-firmware; \

# Kernel
git clone https://github.com/SenseiiX/fusionX_sm8250 -b exp-nxt kernel/xiaomi/munch; \
cd kernel/xiaomi/munch && git submodule init && git submodule update && rm -rf KernelSU-Next/userspace/su && cd ../../..; \

# Hardware Xiaomi
git clone https://github.com/SenseiiX/android_hardware_xiaomi hardware/xiaomi; \

# Hardware Dolby
git clone https://github.com/munch-devs/android_hardware_dolby hardware/dolby; \

# Device Settings
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

# Miui Camera
git clone https://codeberg.org/munch-devs/android_vendor_xiaomi_miuicamera vendor/xiaomi/miuicamera; \


. build/envsetup.sh; \

brunch munch; \
#riseup munch eng && rise b; \
#lunch infinity_munch-user; \
