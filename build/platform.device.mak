MODEL ?= bootloader
USE_LIBA = 1
EXE = elf
ACCEPT_OFFICIAL_TOS ?= 1 # ;)

EPSILON_TELEMETRY ?= 0

BUILD_DIR := $(BUILD_DIR)/$(MODEL)

$(BUILD_DIR)/python/port/port.o: CXXFLAGS += -DMP_PORT_USE_STACK_SYMBOLS=1

include build/platform.device.$(MODEL).mak
