#
# Copyright 2013 The Android Open-Source Project
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

# call dalvik heap config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)

# call hwui memory config
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

DEVICE_PACKAGE_OVERLAYS := \
    device/asus/mofd-common/overlay
    

## Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.fugu \
    audio.r_submix.default \
    audio.stub.default \
    audio.usb.default \
    libaudio-resampler \
    libtinyalsa

## Audio Effects
PRODUCT_PACKAGES += \
    android.hardware.audio@2.0-impl \
    android.hardware.audio.effect@2.0-impl

## Audio Policy
USE_CUSTOM_AUDIO_POLICY := 1
USE_LEGACY_AUDIO_POLICY := 1
USE_XML_AUDIO_POLICY_CONF := 1

PRODUCT_COPY_FILES += \
    device/asus/mofd-common/audio/asound.conf:system/etc/asound.conf \
    device/asus/mofd-common/audio/audio_policy.conf:system/etc/audio_policy.conf \
    device/asus/mofd-common/audio/route_criteria.conf:system/etc/route_criteria.conf

# Boot image hackery
PRODUCT_COPY_FILES += \
    device/asus/mofd-common/releasetools/mkbootimg:install/bin/mkbootimg \
    device/asus/mofd-common/releasetools/unmkbootimg:install/bin/unmkbootimg \
    device/asus/mofd-common/releasetools/sign_boot.sh:install/bin/sign_boot.sh

# Camera
PRODUCT_PACKAGES += \
    bspcapability \
    camera.mofd_v1 \
    libshim_camera \
    Snap

# Charger
PRODUCT_PACKAGES += \
    charger \
    charger_res_images

# Display
PRODUCT_PACKAGES += \
    pvr_drv_video

PRODUCT_COPY_FILES += \
    device/asus/mofd-common/powervr.ini:system/etc/powervr.ini

# Doze
PRODUCT_PACKAGES += \
   ZenfoneDoze

# Flip Cover App
PRODUCT_PACKAGES += \
    FlipFlap

# GPS
PRODUCT_COPY_FILES += \
    device/asus/mofd-common/configs/gps.conf:system/etc/gps.conf \
    device/asus/mofd-common/configs/gps.xml:system/etc/gps.xml

# Init
PRODUCT_PACKAGES += \
    libinit_mofd

# Key layout files
PRODUCT_COPY_FILES += \
    device/asus/mofd-common/keylayout/ASUS_TransKeyboard.kl:system/usr/keylayout/ASUS_TransKeyboard.kl \
    device/asus/mofd-common/keylayout/ftxxxx_ts.kcm:system/usr/keychars/ftxxxx_ts.kcm \
    device/asus/mofd-common/keylayout/ftxxxx_ts.kl:system/usr/keylayout/ftxxxx_ts.kl \
    device/asus/mofd-common/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl \
    device/asus/mofd-common/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl:system/usr/keylayout/lm49453-audio_Intel_MID_Audio_Jack.kl \
    device/asus/mofd-common/keylayout/Vendor_0b05_Product_17fc.kl:system/usr/keylayout/Vendor_0b05_Product_17fc.kl \
    device/asus/mofd-common/keylayout/Vendor_0b05_Product_1803.kl:system/usr/keylayout/Vendor_0b05_Product_1803.kl

# Lights
PRODUCT_PACKAGES += \
    lights.moorefield

# Media
PRODUCT_COPY_FILES += \
    device/asus/mofd-common/media/media_codecs.xml:system/etc/media_codecs.xml \
    device/asus/mofd-common/media/media_profiles.xml:system/etc/media_profiles.xml \
    device/asus/mofd-common/media/mfx_omxil_core.conf:system/etc/mfx_omxil_core.conf \
    device/asus/mofd-common/media/video_isv_profile.xml:system/etc/video_isv_profile.xml \
    device/asus/mofd-common/media/wrs_omxil_components.list:system/etc/wrs_omxil_components.list \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# Media: SDK and OMX IL components
PRODUCT_PACKAGES += \
    msvdx_bin \
    topaz_bin

# Media: libva
PRODUCT_PACKAGES += \
    libva \
    libva-android \
    libva-tpi \
    vainfo

# Media: libstagefrighthw
PRODUCT_PACKAGES += \
    libstagefrighthw

## USB
PRODUCT_PACKAGES += \
    android.hardware.usb@1.0-service.basic

# PowerHAL
PRODUCT_PACKAGES += \
    power.mofd_v1 \
    android.hardware.power@1.0-impl

# Ramdisk
PRODUCT_PACKAGES += \
    config_init.sh \
    fstab.mofd_v1 \
    init.avc.rc \
    init.bt.rc \
    init.bt.vendor.rc \
    init.class_main.sh \
    init.common.rc \
    init.config_init.rc \
    init.debug.rc \
    init.diag.rc \
    init.gps.rc \
    init.logtool.rc \
    init.modem.rc \
    init.mofd_v1.rc \
    init.nfc.rc \
    init.platform.usb.rc \
    init.power.mofd_v1.rc \
    init.recovery.mofd_v1.rc \
    init.watchdog.rc \
    init.wifi.rc \
    init.wifi.vendor.rc \
    init.zram.rc \
    thermald \
    ueventd.mofd_v1.rc

# Sensors
PRODUCT_COPY_FILES += \
    device/asus/mofd-common/configs/sensor_hal_config_default.xml:system/etc/sensor_hal_config_default.xml

# Shims
PRODUCT_PACKAGES += \
    libshim_icu \
    libshim_gpsd \
    libshim_sensors

# Thermal itux
ENABLE_ITUXD := true
PRODUCT_PACKAGES += \
    ituxd

## Graphics
PRODUCT_PACKAGES += \
    android.hardware.graphics.allocator@2.0-impl \
    android.hardware.graphics.composer@2.1-impl \
    android.hardware.graphics.mapper@2.0-impl \
    IMG_graphics \
    hwcomposer.moorefield \
    libion

## Keymaster
PRODUCT_PACKAGES += \
    android.hardware.keymaster@3.0-impl

## Memtrack
PRODUCT_PACKAGES += \
    android.hardware.memtrack@1.0-impl

## OMX
PRODUCT_PACKAGES += \
    libgabi++-mfx \
    libisv_omx_core \
    libmfxsw32 \
    libmfx_omx_core \
    libmfx_omx_components_sw \
    libmixvbp_mpeg4 \
    libmixvbp_h264 \
    libmixvbp_h264secure \
    libmixvbp_vc1 \
    libmixvbp_vp8 \
    libmixvbp_mpeg2 \
    libmixvbp \
    libOMXVideoDecoderAVC \
    libOMXVideoDecoderH263 \
    libOMXVideoDecoderMPEG2 \
    libOMXVideoDecoderMPEG4 \
    libOMXVideoDecoderWMV \
    libOMXVideoDecoderVP8 \
    libOMXVideoDecoderVP9HWR \
    libOMXVideoDecoderVP9Hybrid \
    libOMXVideoEncoderAVC \
    libOMXVideoEncoderH263 \
    libOMXVideoEncoderMPEG4 \
    libOMXVideoEncoderVP8 \
    libstlport-mfx \
    libva_videodecoder \
    libva_videoencoder \
    libwrs_omxil_common \
    libwrs_omxil_core_pvwrapped

# pvr
PRODUCT_PACKAGES += \
    libpvr2d

# libdrm
PRODUCT_PACKAGES += \
    android.hardware.drm@1.0-impl \
    libdrm \
    dristat \
    drmstat

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml

# TV
# PRODUCT_PACKAGES += \
#     droidlogic-tv_input \
#     libstagefright_hdmi

