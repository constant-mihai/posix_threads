SHELL:= /bin/bash

CFLAGS+= -Wall -fno-diagnostics-show-caret 
CPPFLAGS+= -Wall -O0 -fno-diagnostics-show-caret #-g
SUBDIRS := ./utils
CURR_DIR=$(PWD)
CXX = g++ 

program_C_SRCS := $(wildcard *.c)
program_CXX_SRCS := $(wildcard *.C)
program_C_SRCS+=
program_CXX_SRCS+=
program_CXX_OBJS := ${program_CXX_SRCS:.C=.o}
program_C_OBJS := ${program_C_SRCS:.c=.o}
program_INCLUDE_DIRS := 
program_LIBRARY_DIRS := 
#program_LIBRARIES :=  

program_OBJS := $(program_C_OBJS) $(program_CXX_OBJS)

CPPFLAGS += $(foreach includedir,$(program_INCLUDE_DIRS),-I$(includedir))
LDFLAGS += $(foreach librarydir,$(program_LIBRARY_DIRS),-L$(librarydir))
LDFLAGS += $(foreach library,$(program_LIBRARIES),-l$(library))

.PHONY: subdirs $(SUBDIRS) all clean cleanall debug

main: subdirs main.o 
	$(CXX) $(CDEBUG) $(CPPFLAGS) $(LDFLAGS) $(program_OBJS) -o main

subdirs:

main.o: main.C
	$(CXX) $(CDEBUG) $(CPPFLAGS) -c main.C

all: main

clean:
	rm -f *o
	if [ -a main ]; then rm main; fi;

cleanall: 
	rm -f *o
	if [ -a main ]; then rm main; fi;

debug: 
	$(MAKE) CDEBUG="-g"
