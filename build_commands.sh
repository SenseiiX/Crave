#! /bin/bash

rm -rf .repo/local_manifests; \

repo init -u https://github.com/AxionAOSP/android.git -b lineage-22.2 --git-lfs; \

git clone https://github.com/SenseiiX/local_manifest -b axion .repo/local_manifest; \

rm -rf prebuilts/clang/host/linux-x86; \

/opt/crave/resync.sh; \

# Device Settings
rm -rf packages/resources/devicesettings; \
git clone https://github.com/PocoF3Releases/packages_resources_devicesettings packages/resources/devicesettings; \

. build/envsetup.sh; \
brunch munch; \
