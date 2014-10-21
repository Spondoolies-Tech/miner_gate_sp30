export ROOT = $(CURDIR)
include ./tools/build/configure.mk

DIRS-$(MINER_GATE) 			+= miner_gate
DIRS-$(MINER_GATE_TESTER) 	+= miner_gate_tester
DIRS-$(HAMMER_REG) 			+= hammer_reg

build clean:
	set -e; for dir in $(DIRS-y); do make -C $$dir $@; done

install: build
