TARGET30 = miner_gate_sp30
TARGET20 = miner_gate_sp20
INSTALL_DIR=$(TARGET_FS)/bin
CXXFLAGS +=					\
	-DDC2DC_CHECK_ON_ERROR 	\
	-DMINERGATE				\

modules-c = $(wildcard *.c)
modules-c-20-obj = $(subst .c,.20.o,$(modules-c))
modules-c-20-dep := $(subst .c,.20.d,$(modules-c))
modules-c-30-obj = $(subst .c,.30.o,$(modules-c))
modules-c-30-dep := $(subst .c,.30.d,$(modules-c))

modules-cpp = $(wildcard *.cpp)
modules-cpp-obj = $(subst .cpp,.o,$(modules-cpp))
modules-cpp-dep := $(subst .cpp,.d,$(modules-cpp))

modules-dep = $(modules-cpp-dep) $(modules-c-20-dep) $(modules-c-30-dep)  

all: build 

$(modules-cpp-obj): $(@:%.o=%.cpp) $(makefile-dep)
	$(CROSS_COMPILE)g++ $(CXXFLAGS) -DSP2x -c $(@:%.o=%.cpp) -o $@
	$(CROSS_COMPILE)g++ -MM $(CXXFLAGS) -DSP2x $(@:%.o=%.cpp) > $(@:%.o=%.d)

$(modules-c-20-obj): %.20.o: %.c $(makefile-dep)
	$(CROSS_COMPILE)g++ $(CXXFLAGS) -DSP2x -c $(@:%.20.o=%.c) -o $@
	$(CROSS_COMPILE)g++ -MM $(CXXFLAGS) -DSP2x $(@:%.20.o=%.c) > $(@:%.o=%.d)

$(TARGET20): $(modules-c-20-obj) $(modules-cpp-obj)
	$(CROSS_COMPILE)g++ -o $@ $^ $(XLDFLAGS)

$(modules-c-30-obj): %.30.o: %.c $(makefile-dep)
	$(CROSS_COMPILE)g++ $(CXXFLAGS) -DSP2x -c $(@:%.30.o=%.c) -o $@
	$(CROSS_COMPILE)g++ -MM $(CXXFLAGS) -DSP2x $(@:%.30.o=%.c) > $(@:%.o=%.d)

$(TARGET30): $(modules-c-30-obj) $(modules-cpp-obj)
	$(CROSS_COMPILE)g++ -o $@ $^ $(XLDFLAGS)

build: $(TARGET20) $(TARGET30)

install:

clean:
	rm -fr *.o *.d $(TARGET20) $(TARGET30)

-include $(modules-dep) 
