LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libnx_scaler

LOCAL_SRC_FILES := \
	nx-scaler.c
LOCAL_SHARED_LIBRARIES := \
	liblog \
	libcutils \
	libhardware
LOCAL_C_INCLUDES += \
	system/core/include/utils \
	frameworks/native/include \
	$(call include-path-for)

include $(BUILD_SHARED_LIBRARY)
