SHELL:= /bin/bash

CFLAGS+= -Wall -fno-diagnostics-show-caret 
CPPFLAGS+= -Wall -O0 -fno-diagnostics-show-caret
SUBDIRS := 
CURR_DIR=$(PWD)
CXX = $COMPUILER 

program_C_SRCS := $(wildcard *.c)
program_CXX_SRCS := $(wildcard *.C)
program_C_SRCS+=
program_CXX_SRCS+=
#program_CXX_OBJS := ${program_CXX_SRCS:.C=.o}
program_C_OBJS := ${program_C_SRCS:.c=.o}
program_INCLUDE_DIRS := ../utils 
program_LIBRARY_DIRS := 
#program_LIBRARIES :=  

program_OBJS := $(program_C_OBJS) $(program_CXX_OBJS)

CPPFLAGS += $(foreach includedir,$(program_INCLUDE_DIRS),-I$(includedir))
LDFLAGS += $(foreach librarydir,$(program_LIBRARY_DIRS),-L$(librarydir))
LDFLAGS += $(foreach library,$(program_LIBRARIES),-l$(library))

.PHONY: subdirs $(SUBDIRS) all clean cleanall debug

mutex_static: subdirs mutex_static.o 
	$(CXX) $(CDEBUG) $(CPPFLAGS) $(LDFLAGS) mutex_static.o -o mutex_static

mutex_dynamic: subdirs mutex_dynamic.o 
	$(CXX) $(CDEBUG) $(CPPFLAGS) $(LDFLAGS) mutex_dynamic.o -o mutex_dynamic

subdirs:

mutex_static.o: mutex_static.C 
	$(CXX) $(CDEBUG) $(CPPFLAGS) -c mutex_static.C

mutex_dynamic.o: mutex_dynamic.C 
	$(CXX) $(CDEBUG) $(CPPFLAGS) -c mutex_dynamic.C

all: mutex_static mutex_dynamic

print-%: ; @echo $* = $($*)

print-all: ;
	@echo SHELL 				= $(SHELL)
	@echo CFLAGS 				= $(CFLAGS)
	@echo CPPFLAGS 				= $(CPPFLAGS)
	@echo SUBDIRS 				= $(SUBDIRS)
	@echo CURR_DIR 				= $(PWD)
	@echo CXX 					= $(CXX) 
	@echo program_C_SRCS 		= $(program_C_SRCS)
	@echo program_CXX_SRCS 		= $(program_CXX_SRCS)
	@echo program_C_SRCS 		= $(program_C_SRCS)
	@echo program_CXX_SRCS 		= $(program_CXX_SRCS)
	@echo program_CXX_OBJS 		= $(program_CXX_OBJS)
	@echo program_C_OBJS 		= $(program_C_OBJS)
	@echo program_INCLUDE_DIRS 	= $(program_INCLUDE_DIRS) 
	@echo program_LIBRARY_DIRS 	= $(program_LIBRARY_DIRS)
	@echo program_LIBRARIES 	= $(program_LIBRARIES)

program_OBJS := $(program_C_OBJS) $(program_CXX_OBJS)


clean:
	rm -f *o
	if [ -a mutex_static ]; then rm mutex_static; fi;
	if [ -a mutex_dynamic ]; then rm mutex_dynamic; fi;

cleanall: 
	rm -f *o
	if [ -a mutex_static ]; then rm mutex_static; fi;

debug: 
	$(MAKE) CDEBUG="-g"
