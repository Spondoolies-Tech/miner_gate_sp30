export GIT_VERSION := $(shell sh $(ROOT)/git_version.sh)
ifeq ($(GIT_VERSION),)
    $(error "fail to obtain version from git, GIT_VERSION is empty")
endif
export VERSION = \"$(GIT_VERSION)\"

export MINER_GATE := y
export MINER_GATE_TESTER := y
export HAMMER_REG := y

export PATH:=/opt/arm-2013.05/bin:$(PATH)
export CROSS_COMPILE=arm-none-linux-gnueabi-

export CXXFLAGS = 			\
	-O0			  			\
	-g 						\
	-rdynamic				\
	-fpermissive 			\
	-lpthread 				\
	-static-libstdc++ 		\
	-static-libgcc 			\
	-I$(ROOT)/miner_gate	\
	-I$(ROOT)/i2ctools		\

export XLDFLAGS :=	\
	-pthread       	\

export makefile-dep = $(ROOT)/$(dir $(lastword $(MAKEFILE_LIST)))configure.mk
export makefile-dep += $(shell find $(ROOT) -name Makefile)
