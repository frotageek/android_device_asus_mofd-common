# Copyright (C) 2015 The Android Open Source Project
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

ifeq ($(TARGET_POWERHAL_VARIANT),mofd_v1)

LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_CFLAGS += -Werror
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libutils
LOCAL_SRC_FILES := power.cpp
LOCAL_MODULE := power.mofd_v1
LOCAL_PROPRIETARY_MODULE := true

ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)

endif # TARGET_POWERHAL_VARIANT == mofd_v1
