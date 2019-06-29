# OpenJazz makefile
include openjazz.mk

# Sane defaults
CXX ?= g++
#CXXFLAGS ?= -g -Wall -O2
CXXFLAGS ?= -ggdb -Wall -O0
CPPFLAGS = -Isrc -DSCALE -Iext/scale2x -Iext/psmplug -Iext/miniz

# Network support
CXXFLAGS += -DUSE_SOCKETS
# Needed under Windows
#LIBS += -lws2_32

# SDL 1
#CXXFLAGS += $(shell sdl-config --cflags)
#LIBS += $(shell sdl-config --libs)

# SDL2
CXXFLAGS += $(shell sdl2-config --cflags) -DSDL2
LIBS += $(shell sdl2-config --libs)

LIBS += -lm

OpenJazz: $(OBJS)
	$(CXX) -o OpenJazz $(LDFLAGS) $(OBJS) $(LIBS)

%.o: %.cpp
	$(CXX) $(CPPFLAGS) $(CXXFLAGS) -c $< -o $@

clean:
	rm -f OpenJazz $(OBJS)
