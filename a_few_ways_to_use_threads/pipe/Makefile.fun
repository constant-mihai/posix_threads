######################################################################
# Functions, Oneliners & SoupCans*  
# *Does not contain soup!
######################################################################

#
# Check subirs for libs 
# -------------------------------------- #
# -------------------------------------- #
f_check_subdirs_for_libs = $(if $(library_dirs),$(compile_subdirectories),)


#
# Compile subdirectories 
# -------------------------------------- #
# -------------------------------------- #
define f_compile_subdir
cd $(1); make; cd $(CURR_DIR); 
endef

compile_subdirectories = $(foreach dir,$(library_dirs),$(call f_compile_subdir,$(dir)))
clean_subdirectories = $(foreach dir,$(library_dirs),$(call f_clean_subdir,$(dir)))


#
# User defines functions. 
# -------------------------------------- #
# -------------------------------------- #
# Look into each directory from subdirs and search for *.(arg).
# Where arg can be:
# A header file
#  - h
#  - hpp
#  - H
# Or a source file
#  - c
#  - cpp
#  - C
f_deep_source_search = $(foreach dir,$(subdirs),$(wildcard $(dir)/*.$(1)))
f_deep_includes_search = $(foreach dir,$(include_dirs),$(wildcard $(dir)/*.$(1)))

#
# Compile shared libs 
# -------------------------------------- #
# -------------------------------------- #
# Compilation command for a shared lib. One liner:
#compile_shared_lib = $(compiler) $(shared_flags) $(objs_without_main) -o $(shl_fullname) $(LDFLAGS); ln -sf $(shl_fullname) $(shl_soname); ln -sf $(shl_fullname) $(shl_linker_name)
# Two liner, define:
define compile_shared_lib
$(compiler) $(shared_flags) $(objs_without_main) -o $(shl_fullname) $(LDFLAGS)
ln -sf $(shl_fullname) $(shl_soname)
ln -sf $(shl_fullname) $(shl_linker_name)
endef

#
# Compile main 
# -------------------------------------- #
# -------------------------------------- #
# Test if this is the root directory of the project.
# If it is then compile this as such.
# It it is NOT then compile this as a lib.
compile = $(if $(findstring yes,$(main)),$(compile_main),$(compile_shared_lib))

#
# Clean functions 
# -------------------------------------- #
# -------------------------------------- #
define f_clean
rm -f *.o; rm -f *.so*;
endef

define f_clean_main
$(f_clean) if [ -a $(name) ]; then rm $(name); fi;
endef

define f_clean_subdir
cd $(1); $(f_clean) cd $(CURR_DIR);
endef

