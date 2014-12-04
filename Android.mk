# Can't have both 65xx and 60xx sensors.
ifneq ($(filter hammerhead, $(TARGET_DEVICE)),)
# hammerhead expects 65xx sensors.
TARGET_INVENSENSE_SENSOR := 65xx
endif

ifneq ($(filter guppy dory, $(TARGET_DEVICE)),)
# dory and guppy expect 6515 sensors.
TARGET_INVENSENSE_SENSOR := 6515
endif

ifneq ($(filter manta grouper tuna mako, $(TARGET_DEVICE)),)
# manta, grouper, tuna, and mako expect 60xx sensors.
TARGET_INVENSENSE_SENSOR := 60xx
endif

ifneq ($(filter 60xx 6515 65xx,$(TARGET_INVENSENSE_SENSOR)),)
include $(call all-named-subdir-makefiles,$(TARGET_INVENSENSE_SENSOR))
endif
