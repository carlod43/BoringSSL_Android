LOCAL_PATH := $(call my-dir)

include $(LOCAL_PATH)/sources.mk

include $(CLEAR_VARS)
LOCAL_MODULE            := crypto_static
LOCAL_SRC_FILES         := $(crypto_sources)
ifeq ($(TARGET_ARCH_ABI),armeabi-v7a)
        LOCAL_SRC_FILES += $(linux_arm_sources)
else ifeq ($(TARGET_ARCH_ABI),arm64-v8a)
        LOCAL_SRC_FILES += $(linux_aarch64_sources)
else ifeq ($(TARGET_ARCH_ABI),x86)
        LOCAL_SRC_FILES += $(linux_x86_sources)
else ifeq ($(TARGET_ARCH_ABI),x86_64)
        LOCAL_SRC_FILES += $(linux_x86_64_sources)
endif
LOCAL_C_INCLUDES        := $(LOCAL_PATH)/src/crypto
LOCAL_C_INCLUDES        += $(LOCAL_PATH)/src/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/src/include
include $(BUILD_STATIC_LIBRARY)

include $(CLEAR_VARS)
LOCAL_MODULE            := ssl_static
LOCAL_SRC_FILES         := $(libssl_sources)
LOCAL_C_INCLUDES        := $(LOCAL_PATH)/src/include
LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/src/include
LOCAL_STATIC_LIBRARIES  := crypto_static
include $(BUILD_STATIC_LIBRARY)
