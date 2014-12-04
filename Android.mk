# Can't have both 65xx and 60xx sensors.
ifneq ($(filter hammerhead, $(TARGET_DEVICE)),)
# hammerhead expects 65xx sensors.
TARGET_INVENSENSE_SENSOR := 65xx
endif

ifneq ($(filter guppy dory, $(TARGET_DEVICE)),)
# dory and guppy expect 6515 sensors.
TARGET_INVENSENSE_SENSOR := 6515
endif

ifneq ($(filter 6515 65xx,$(TARGET_INVENSENSE_SENSOR)),)
include $(call all-named-subdir-makefiles,$(TARGET_INVENSENSE_SENSOR))
endif
