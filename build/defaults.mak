HOSTCC = gcc
HOSTCXX = g++
PYTHON = python3

SFLAGS += -DEPSILON_GETOPT=1
SFLAGS += -DEPSILON_TELEMETRY=0
SFLAGS += -DESCHER_LOG_EVENTS_BINARY=0

# Language-specific flags
CFLAGS = -std=c99
CXXFLAGS = -std=c++11 -fno-exceptions -fno-rtti -fno-threadsafe-statics

# Flags - Optimizations
ifeq ($(DEBUG),1)
SFLAGS += -O0 -g
else
SFLAGS += -Os
SFLAGS += -DNDEBUG
endif

ifeq ($(ASAN),1)
SFLAGS += -fsanitize=address
LDFLAGS += -fsanitize=address
endif

# Flags - Header search path
SFLAGS += -Ilib -I.

# Flags - Building options
SFLAGS += -Wall

# Flags - Header dependency tracking
SFLAGS += -MD -MP

# Building directory
ifeq ($(DEBUG),1)
  BUILD_TYPE = debug
else
  BUILD_TYPE = release
endif
BUILD_DIR = output/$(BUILD_TYPE)/$(PLATFORM)

# Define "Q" as an arobase by default to silence-out every command run by make.
# If V=1 is supplied on the make command line, undefine Q so that every command
# is echoed out.
Q=@
BUILD_VERBOSE=0
ifeq ("$(origin V)", "command line")
  ifeq ($(V),1)
    BUILD_VERBOSE=1
    Q=
  endif
endif

ifeq ("$(PLATFORM)", "device")
  SFLAGS += -DPLATFORM_DEVICE
  ifeq ("$(MODEL)", "n0100")
    SFLAGS += -DDEVICE_N0100
  else
    SFLAGS += -DDEVICE_N0110
  endif
endif

# Host detection
ifeq ($(OS),Windows_NT)
HOST = windows
else
uname_s := $(shell uname -s)
ifeq ($(uname_s),Linux)
HOST = linux
else
HOST = unknown
endif
endif
