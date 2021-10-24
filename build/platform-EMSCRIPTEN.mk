include $(SRC_PATH)build/arch.mk
SHAREDLIBSUFFIX = so
SHAREDLIBSUFFIXFULLVER=$(SHAREDLIBSUFFIX).$(FULL_VERSION)
SHAREDLIBSUFFIXMAJORVER=$(SHAREDLIBSUFFIX).$(SHAREDLIB_MAJORVERSION)
SHLDFLAGS = -Wl,-soname,$(LIBPREFIX)$(PROJECT_NAME).$(SHAREDLIBSUFFIXMAJORVER)
CFLAGS += -Wall -fno-strict-aliasing -fPIC -MMD -MP

CFLAGS += -fno-stack-protector
LDFLAGS += -lpthread
STATIC_LDFLAGS += -lpthread -lm
AR_OPTS = crD $@
USE_ASM = No

ifeq ($(CXX), clang++)
CXXFLAGS += -Wc++11-compat-reserved-user-defined-literal
endif

