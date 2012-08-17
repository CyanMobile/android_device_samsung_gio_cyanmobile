# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for sapphire hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps).
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS := device/samsung/gio/overlay

PRODUCT_PACKAGES += \
    LiveWallpapers \
    LiveWallpapersPicker \
    MagicSmokeWallpapers \
    VisualizationWallpapers \
    librs_jni \
    libOmxCore \
    make_ext4fs \
    brcm_patchram_plus \
    sec_touchscreen.kcm \
    copybit.gio \
    lights.gio \
    gralloc.gio \
    gps.gio \
    setup_fs \
    CMTimers \
    FM \
    CMDroidwall \
    SamsungServiceMode \
    rzscontrol \
    bdaddr_read \
    dump_image \
    e2fsck \
    setup_fs \
    toggleshutter \
    patchlcs \
    erase_image \
    flash_image \
    screencap \
    dexpreopt

# proprietary side of the device
$(call inherit-product-if-exists, vendor/samsung/gio/gio-vendor.mk)

DISABLE_DEXPREOPT := false

PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/abtfilt:system/bin/abtfilt \
    device/samsung/gio/prebuilt/memsicd:system/bin/memsicd \
    device/samsung/gio/prebuilt/qmuxd:system/bin/qmuxd \
    device/samsung/gio/prebuilt/wmiconfig:system/bin/wmiconfig \
    device/samsung/gio/prebuilt/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/samsung/gio/prebuilt/sec_touchscreen.kl:system/usr/keylayout/sec_touchscreen.kl \
    device/samsung/gio/prebuilt/sec_jack.kl:system/usr/keylayout/sec_jack.kl \
    device/samsung/gio/prebuilt/sec_key.kl:system/usr/keylayout/sec_key.kl
  

# fstab
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/vold.fstab:system/etc/vold.fstab

# Init
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/init.gt-s5660.rc:root/init.gt-s5660.rc \
    device/samsung/gio/prebuilt/GIO.rle:root/GIO.rle \
    device/samsung/gio/prebuilt/ueventd.gt-s5660.rc:root/ueventd.gt-s5660.rc

# Audio
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/samsung/gio/prebuilt/audio_effects.conf:system/etc/audio_effects.conf \
    device/samsung/gio/prebuilt/poweron.ogg:system/media/poweron.ogg \
    device/samsung/gio/prebuilt/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt

# WLAN + BT
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
    device/samsung/gio/prebuilt/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/samsung/gio/prebuilt/hostapd:system/bin/hostapd \
    device/samsung/gio/prebuilt/wlan_mac:system/bin/wlan_mac \
    device/samsung/gio/prebuilt/get_macaddrs:system/bin/get_macaddrs \
    device/samsung/gio/prebuilt/wlan_tool:system/bin/wlan_tool \
    device/samsung/gio/prebuilt/hostapd.conf:system/etc/wifi/hostapd.conf
    
# Hardware
PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml

#Kernel Modules
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/modules/fsr.ko:root/lib/modules/fsr.ko \
    device/samsung/gio/prebuilt/modules/fsr_stl.ko:root/lib/modules/fsr_stl.ko \
    device/samsung/gio/prebuilt/modules/sec_param.ko:root/lib/modules/sec_param.ko \
    device/samsung/gio/prebuilt/ar6000.ko:system/wifi/ar6000.ko

#WiFi firmware
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/athtcmd_ram.bin:system/wifi/ath6k/AR6003/hw2.0/athtcmd_ram.bin \
    device/samsung/gio/prebuilt/athwlan.bin.z77:system/wifi/ath6k/AR6003/hw2.0/athwlan.bin.z77 \
    device/samsung/gio/prebuilt/bdata.SD31.bin:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin \
    device/samsung/gio/prebuilt/bdata.SD31.bin.04:system/wifi/ath6k/AR6003/hw2.0/bdata.SD31.bin.04 \
    device/samsung/gio/prebuilt/data.patch.bin:system/wifi/ath6k/AR6003/hw2.0/data.patch.bin \
    device/samsung/gio/prebuilt/otp.bin.z77:system/wifi/ath6k/AR6003/hw2.0/otp.bin.z77
    
#GPU firmware
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw \
    device/samsung/gio/prebuilt/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw

#Media profile
PRODUCT_COPY_FILES += \
    device/samsung/gio/prebuilt/media_profiles.xml:system/etc/media_profiles.xml

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# See comment at the top of this file. This is where the other
# half of the device-specific product definition file takes care
# of the aspects that require proprietary drivers that aren't
# commonly available
$(call inherit-product-if-exists, vendor/samsung/gio/gio-vendor-blobs.mk)

PRODUCT_NAME := gio
PRODUCT_DEVICE := gio
PRODUCT_MODEL := GT-S5660
PRODUCT_BRAND := samsung
PRODUCT_MANUFACTURER := samsung
