######################################################################
# Recipes.
######################################################################
include Makefile.var 
include Makefile.fun

#
# Phony 
# ----------------------------- #
# ----------------------------- #
.PHONY: all clean cleanall debug help


#
# Recipes
#

main: $(objs)
>   @echo Making Main
>   $(f_check_subdirs_for_libs)
>   $(compiler) cond_static.o -o cond_static $(LDFLAGS)
>   $(compiler) cond_dynamic.o -o cond_dynamic $(LDFLAGS)
>   $(compiler) condition.o -o condition $(LDFLAGS)

$(objs): $(srcs) $(incs)

subdirs:

all: main

shared: $(objs)
>   @echo Making Shared lib 
>   $(f_check_subdirs_for_libs)
>   $(compile_shared_lib)

print-%: ; @echo $* = $($*)

print-all: ;
>    @echo ------------------------------ General
>    @echo SHELL                = $(SHELL)
>    @echo name                 = $(name) 
>    @echo ------------------------------------------ Shared library
>    @echo shl_name           = $(shl_name) 
>    @echo shl_version        = $(shl_version)
>    @echo shl_release_number = $(shl_release_number) 
>    @echo shl_minor_number   = $(shl_minor_number)
>    @echo shl_linker_name    = $(shl_linker_name)
>    @echo shl_soname         = $(shl_soname)
>    @echo shl_fullname       = $(shl_fullname)

>    @echo ------------------------------------------ Directories  
>    @echo subdirs              = $(subdirs) 
>    @echo CURR_DIR             = $($CURR_DIR)
>    @echo include_dirs = $(include_dirs) 
>    @echo library_dirs = $(library_dirs)
>    @echo libraries    = $(libraries)

>    @echo ---------------------------- Compiler 
>    @echo CC                   = $(CC) 
>    @echo CXX                  = $(CXX) 
>    @echo compiler             = $(compiler)

>    @echo ---------------------------- Flags
>    @echo shared               = $(shared)
>    @echo CFLAGS               = $(CFLAGS)
>    @echo CPPFLAGS             = $(CPPFLAGS)
>    @echo LDFLAGS              = $(LDFLAGS)

>    @echo ---------------------------- Sources 
>    @echo c_srcs       = $(c_srcs)
>    @echo c_srcs       = $(c_srcs)
>    @echo cxx_srcs     = $(cxx_srcs)
>    @echo ---------------------------- Objects 
>    @echo cxx_objs     = $(cxx_objs)
>    @echo c_objs       = $(c_objs)
>    @echo ---------------------------- Headers 
>    @echo h            = $(h)
>    @echo hpp          = $(hpp)
>    @echo cap_h        = $(cap_h)

clean:
>   $(f_clean_main)

cleanall: 
>   $(if $(findstring yes,$(recursive)),$(clean_subdirectories),)
>   $(f_clean_main)

debug: CPPFLAGS += -g 
debug: all 

debug-shared: CPPFLAGS += -g
debug-shared: shared

help:
>   @$(MAKE) --print-data-base --question main | \
	grep -v -e '^no-such-target' -e '^makefile' |       \
    awk '/^[^.%][-A-Za-z0-9_]*:/                        \
          { print substr($$1, 1, length($$1)-1) }' |      \
    sort 

# Alternatively:
# awk '/^[^.%][-A-Za-z0-9_]*:/ { print }' |      \
