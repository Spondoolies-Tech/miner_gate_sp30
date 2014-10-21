TARGET = reg
INSTALL_DIR=$(TARGET_FS)/bin

modules-c = $(wildcard *.c)
modules-c-obj = $(subst .c,.o,$(modules-c))
modules-c-dep := $(subst .c,.d,$(modules-c))

modules-dep = $(modules-c-dep)

all: build 

$(modules-c-obj): $(@:%.o=%.c) $(makefile-dep)
	$(CROSS_COMPILE)g++ $(CXXFLAGS) -c $(@:%.o=%.c) -o $@
	$(CROSS_COMPILE)g++ -MM $(CXXFLAGS) $(@:%.o=%.c) > $(@:%.o=%.d)

$(TARGET): $(modules-c-obj)
	$(CROSS_COMPILE)g++ -o $@ $^ $(XLDFLAGS)

build: $(TARGET)

install:

clean:
	rm -fr *.o *.d $(TARGET)

-include $(modules-dep) 
