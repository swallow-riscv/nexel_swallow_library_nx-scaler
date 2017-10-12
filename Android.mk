LOCAL_PATH := $(call my-dir)
include $(CLEAR_VARS)

#
#	Compile Flags
#

#
#	Compile Options
#

LOCAL_CFLAGS += -DPLATFORM_SDK_VERSION=$(PLATFORM_SDK_VERSION)

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/include		\
	system/core/include			\
	system/media/core/include 	\
	system/core/libsync/include \
	frameworks/native/include 	\
	frameworks/av/include 		\
	hardware/nexell/s5pxx18/gralloc

LOCAL_SHARED_LIBRARIES :=	\
	liblog 		\
	libcutils	\
	libhardware

LOCAL_SRC_FILES := \
	nx-scaler.c

# We need this because the current asm generates the following link error:
# requires unsupported dynamic reloc R_ARM_REL32; recompile with -fPIC
# Bug: 16853291
LOCAL_LDFLAGS := -Wl,-Bsymbolic
LOCAL_LDFLAGS += \
	-L$(LINUX_LIBS)

LOCAL_MODULE := libnx_scaler

LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)

