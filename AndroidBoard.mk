LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

#TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/kernel
#INSTALLED_KERNEL_TARGET := $(TARGET_PREBUILT_KERNEL)

#file := $(INSTALLED_KERNEL_TARGET)
#ALL_PREBUILT += $(file)
#$(file) : $(TARGET_PREBUILT_KERNEL) | $(ACP)
#	$(transform-prebuilt-to-target)

#ALL_PREBUILT += $(INSTALLED_KERNEL_TARGET)

# include the non-open-source counterpart to this file
-include vendor/huawei/g620_l75/AndroidBoardVendor.mk


