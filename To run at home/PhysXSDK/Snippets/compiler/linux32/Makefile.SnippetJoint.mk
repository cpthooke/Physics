# Makefile generated by XPJ for linux32
-include Makefile.custom
ProjectName = SnippetJoint
SnippetJoint_cppfiles   += ./../../SnippetCommon/ClassicMain.cpp
SnippetJoint_cppfiles   += ./../../SnippetJoint/SnippetJoint.cpp
SnippetJoint_cppfiles   += ./../../SnippetJoint/SnippetJointRender.cpp

SnippetJoint_cpp_debug_dep    = $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.P, $(SnippetJoint_cppfiles)))))
SnippetJoint_cc_debug_dep    = $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.debug.P, $(SnippetJoint_ccfiles)))))
SnippetJoint_c_debug_dep      = $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.P, $(SnippetJoint_cfiles)))))
SnippetJoint_debug_dep      = $(SnippetJoint_cpp_debug_dep) $(SnippetJoint_cc_debug_dep) $(SnippetJoint_c_debug_dep)
-include $(SnippetJoint_debug_dep)
SnippetJoint_cpp_checked_dep    = $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.P, $(SnippetJoint_cppfiles)))))
SnippetJoint_cc_checked_dep    = $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.checked.P, $(SnippetJoint_ccfiles)))))
SnippetJoint_c_checked_dep      = $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.P, $(SnippetJoint_cfiles)))))
SnippetJoint_checked_dep      = $(SnippetJoint_cpp_checked_dep) $(SnippetJoint_cc_checked_dep) $(SnippetJoint_c_checked_dep)
-include $(SnippetJoint_checked_dep)
SnippetJoint_cpp_profile_dep    = $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.P, $(SnippetJoint_cppfiles)))))
SnippetJoint_cc_profile_dep    = $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.profile.P, $(SnippetJoint_ccfiles)))))
SnippetJoint_c_profile_dep      = $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.P, $(SnippetJoint_cfiles)))))
SnippetJoint_profile_dep      = $(SnippetJoint_cpp_profile_dep) $(SnippetJoint_cc_profile_dep) $(SnippetJoint_c_profile_dep)
-include $(SnippetJoint_profile_dep)
SnippetJoint_cpp_release_dep    = $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.P, $(SnippetJoint_cppfiles)))))
SnippetJoint_cc_release_dep    = $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.release.P, $(SnippetJoint_ccfiles)))))
SnippetJoint_c_release_dep      = $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.P, $(SnippetJoint_cfiles)))))
SnippetJoint_release_dep      = $(SnippetJoint_cpp_release_dep) $(SnippetJoint_cc_release_dep) $(SnippetJoint_c_release_dep)
-include $(SnippetJoint_release_dep)
SnippetJoint_debug_hpaths    := 
SnippetJoint_debug_hpaths    += ./../../../Include
SnippetJoint_debug_lpaths    := 
SnippetJoint_debug_lpaths    += ./../../../Lib/linux32
SnippetJoint_debug_lpaths    += ./../../lib/linux32
SnippetJoint_debug_lpaths    += ./../../../Bin/linux32
SnippetJoint_debug_lpaths    += ./../../lib/linux32
SnippetJoint_debug_defines   := $(SnippetJoint_custom_defines)
SnippetJoint_debug_defines   += PHYSX_PROFILE_SDK
SnippetJoint_debug_defines   += RENDER_SNIPPET
SnippetJoint_debug_defines   += _DEBUG
SnippetJoint_debug_defines   += PX_DEBUG
SnippetJoint_debug_defines   += PX_CHECKED
SnippetJoint_debug_defines   += PX_SUPPORT_VISUAL_DEBUGGER
SnippetJoint_debug_libraries := 
SnippetJoint_debug_libraries += SnippetRenderDEBUG
SnippetJoint_debug_libraries += SnippetUtilsDEBUG
SnippetJoint_debug_libraries += PhysX3DEBUG_x86
SnippetJoint_debug_libraries += PhysX3CommonDEBUG_x86
SnippetJoint_debug_libraries += PhysX3CookingDEBUG_x86
SnippetJoint_debug_libraries += PhysX3CharacterKinematicDEBUG_x86
SnippetJoint_debug_libraries += PhysX3ExtensionsDEBUG
SnippetJoint_debug_libraries += PhysX3VehicleDEBUG
SnippetJoint_debug_libraries += PhysXProfileSDKDEBUG
SnippetJoint_debug_libraries += PhysXVisualDebuggerSDKDEBUG
SnippetJoint_debug_libraries += PxTaskDEBUG
SnippetJoint_debug_libraries += SnippetUtilsDEBUG
SnippetJoint_debug_libraries += SnippetRenderDEBUG
SnippetJoint_debug_libraries += GL
SnippetJoint_debug_libraries += GLU
SnippetJoint_debug_libraries += glut
SnippetJoint_debug_libraries += X11
SnippetJoint_debug_libraries += rt
SnippetJoint_debug_libraries += pthread
SnippetJoint_debug_common_cflags	:= $(SnippetJoint_custom_cflags)
SnippetJoint_debug_common_cflags    += -MMD
SnippetJoint_debug_common_cflags    += $(addprefix -D, $(SnippetJoint_debug_defines))
SnippetJoint_debug_common_cflags    += $(addprefix -I, $(SnippetJoint_debug_hpaths))
SnippetJoint_debug_common_cflags  += -m32
SnippetJoint_debug_common_cflags  += -Werror -m32 -fPIC -msse2 -mfpmath=sse -malign-double -ffast-math -fno-exceptions -fno-rtti -fvisibility=hidden -fvisibility-inlines-hidden
SnippetJoint_debug_common_cflags  += -Wall -Wextra -Wstrict-aliasing=2 -fdiagnostics-show-option
SnippetJoint_debug_common_cflags  += -Wno-long-long
SnippetJoint_debug_common_cflags  += -Wno-unknown-pragmas -Wno-invalid-offsetof -Wno-uninitialized
SnippetJoint_debug_common_cflags  += -Wno-unused-parameter
SnippetJoint_debug_common_cflags  += -g3 -gdwarf-2
SnippetJoint_debug_cflags	:= $(SnippetJoint_debug_common_cflags)
SnippetJoint_debug_cppflags	:= $(SnippetJoint_debug_common_cflags)
SnippetJoint_debug_lflags    := $(SnippetJoint_custom_lflags)
SnippetJoint_debug_lflags    += $(addprefix -L, $(SnippetJoint_debug_lpaths))
SnippetJoint_debug_lflags    += -Wl,--start-group $(addprefix -l, $(SnippetJoint_debug_libraries)) -Wl,--end-group
SnippetJoint_debug_lflags  += -lrt
SnippetJoint_debug_lflags  += -Wl,-rpath ./
SnippetJoint_debug_lflags  += -m32
SnippetJoint_debug_objsdir  = $(OBJS_DIR)/SnippetJoint_debug
SnippetJoint_debug_cpp_o    = $(addprefix $(SnippetJoint_debug_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.o, $(SnippetJoint_cppfiles)))))
SnippetJoint_debug_cc_o    = $(addprefix $(SnippetJoint_debug_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.o, $(SnippetJoint_ccfiles)))))
SnippetJoint_debug_c_o      = $(addprefix $(SnippetJoint_debug_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.o, $(SnippetJoint_cfiles)))))
SnippetJoint_debug_obj      = $(SnippetJoint_debug_cpp_o) $(SnippetJoint_debug_cc_o) $(SnippetJoint_debug_c_o)
SnippetJoint_debug_bin      := ./../../../Bin/linux32/SnippetJointDEBUG

clean_SnippetJoint_debug: 
	@$(ECHO) clean SnippetJoint debug
	@$(RMDIR) $(SnippetJoint_debug_objsdir)
	@$(RMDIR) $(SnippetJoint_debug_bin)
	@$(RMDIR) $(DEPSDIR)/SnippetJoint/debug

build_SnippetJoint_debug: postbuild_SnippetJoint_debug
postbuild_SnippetJoint_debug: mainbuild_SnippetJoint_debug
mainbuild_SnippetJoint_debug: prebuild_SnippetJoint_debug $(SnippetJoint_debug_bin)
prebuild_SnippetJoint_debug:

$(SnippetJoint_debug_bin): $(SnippetJoint_debug_obj) build_SnippetRender_debug build_SnippetUtils_debug 
	mkdir -p `dirname ./../../../Bin/linux32/SnippetJointDEBUG`
	$(CCLD) $(SnippetJoint_debug_obj) $(SnippetJoint_debug_lflags) -o $(SnippetJoint_debug_bin) 
	$(ECHO) building $@ complete!

SnippetJoint_debug_DEPDIR = $(dir $(@))/$(*F)
$(SnippetJoint_debug_cpp_o): $(SnippetJoint_debug_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling debug $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cppfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_debug_cppflags) -c $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cppfiles)) -o $@
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cppfiles))))))
	cp $(SnippetJoint_debug_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_debug_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  rm -f $(SnippetJoint_debug_DEPDIR).d

$(SnippetJoint_debug_cc_o): $(SnippetJoint_debug_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling debug $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_ccfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_debug_cppflags) -c $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_ccfiles)) -o $@
	mkdir -p $(dir $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_ccfiles))))))
	cp $(SnippetJoint_debug_DEPDIR).d $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_ccfiles))))).debug.P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_debug_DEPDIR).d >> $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_ccfiles))))).debug.P; \
	  rm -f $(SnippetJoint_debug_DEPDIR).d

$(SnippetJoint_debug_c_o): $(SnippetJoint_debug_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling debug $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cfiles))...
	mkdir -p $(dir $(@))
	$(CC) $(SnippetJoint_debug_cflags) -c $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cfiles)) -o $@ 
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cfiles))))))
	cp $(SnippetJoint_debug_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_debug_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/debug/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_debug_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  rm -f $(SnippetJoint_debug_DEPDIR).d

SnippetJoint_checked_hpaths    := 
SnippetJoint_checked_hpaths    += ./../../../Include
SnippetJoint_checked_lpaths    := 
SnippetJoint_checked_lpaths    += ./../../../Lib/linux32
SnippetJoint_checked_lpaths    += ./../../lib/linux32
SnippetJoint_checked_lpaths    += ./../../../Bin/linux32
SnippetJoint_checked_lpaths    += ./../../lib/linux32
SnippetJoint_checked_defines   := $(SnippetJoint_custom_defines)
SnippetJoint_checked_defines   += PHYSX_PROFILE_SDK
SnippetJoint_checked_defines   += RENDER_SNIPPET
SnippetJoint_checked_defines   += NDEBUG
SnippetJoint_checked_defines   += PX_CHECKED
SnippetJoint_checked_defines   += PX_SUPPORT_VISUAL_DEBUGGER
SnippetJoint_checked_libraries := 
SnippetJoint_checked_libraries += SnippetRenderCHECKED
SnippetJoint_checked_libraries += SnippetUtilsCHECKED
SnippetJoint_checked_libraries += PhysX3CHECKED_x86
SnippetJoint_checked_libraries += PhysX3CommonCHECKED_x86
SnippetJoint_checked_libraries += PhysX3CookingCHECKED_x86
SnippetJoint_checked_libraries += PhysX3CharacterKinematicCHECKED_x86
SnippetJoint_checked_libraries += PhysX3ExtensionsCHECKED
SnippetJoint_checked_libraries += PhysX3VehicleCHECKED
SnippetJoint_checked_libraries += PhysXProfileSDKCHECKED
SnippetJoint_checked_libraries += PhysXVisualDebuggerSDKCHECKED
SnippetJoint_checked_libraries += PxTaskCHECKED
SnippetJoint_checked_libraries += SnippetUtilsCHECKED
SnippetJoint_checked_libraries += SnippetRenderCHECKED
SnippetJoint_checked_libraries += GL
SnippetJoint_checked_libraries += GLU
SnippetJoint_checked_libraries += glut
SnippetJoint_checked_libraries += X11
SnippetJoint_checked_libraries += rt
SnippetJoint_checked_libraries += pthread
SnippetJoint_checked_common_cflags	:= $(SnippetJoint_custom_cflags)
SnippetJoint_checked_common_cflags    += -MMD
SnippetJoint_checked_common_cflags    += $(addprefix -D, $(SnippetJoint_checked_defines))
SnippetJoint_checked_common_cflags    += $(addprefix -I, $(SnippetJoint_checked_hpaths))
SnippetJoint_checked_common_cflags  += -m32
SnippetJoint_checked_common_cflags  += -Werror -m32 -fPIC -msse2 -mfpmath=sse -malign-double -ffast-math -fno-exceptions -fno-rtti -fvisibility=hidden -fvisibility-inlines-hidden
SnippetJoint_checked_common_cflags  += -Wall -Wextra -Wstrict-aliasing=2 -fdiagnostics-show-option
SnippetJoint_checked_common_cflags  += -Wno-long-long
SnippetJoint_checked_common_cflags  += -Wno-unknown-pragmas -Wno-invalid-offsetof -Wno-uninitialized
SnippetJoint_checked_common_cflags  += -Wno-unused-parameter
SnippetJoint_checked_common_cflags  += -g3 -gdwarf-2 -O3 -fno-strict-aliasing
SnippetJoint_checked_cflags	:= $(SnippetJoint_checked_common_cflags)
SnippetJoint_checked_cppflags	:= $(SnippetJoint_checked_common_cflags)
SnippetJoint_checked_lflags    := $(SnippetJoint_custom_lflags)
SnippetJoint_checked_lflags    += $(addprefix -L, $(SnippetJoint_checked_lpaths))
SnippetJoint_checked_lflags    += -Wl,--start-group $(addprefix -l, $(SnippetJoint_checked_libraries)) -Wl,--end-group
SnippetJoint_checked_lflags  += -lrt
SnippetJoint_checked_lflags  += -Wl,-rpath ./
SnippetJoint_checked_lflags  += -m32
SnippetJoint_checked_objsdir  = $(OBJS_DIR)/SnippetJoint_checked
SnippetJoint_checked_cpp_o    = $(addprefix $(SnippetJoint_checked_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.o, $(SnippetJoint_cppfiles)))))
SnippetJoint_checked_cc_o    = $(addprefix $(SnippetJoint_checked_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.o, $(SnippetJoint_ccfiles)))))
SnippetJoint_checked_c_o      = $(addprefix $(SnippetJoint_checked_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.o, $(SnippetJoint_cfiles)))))
SnippetJoint_checked_obj      = $(SnippetJoint_checked_cpp_o) $(SnippetJoint_checked_cc_o) $(SnippetJoint_checked_c_o)
SnippetJoint_checked_bin      := ./../../../Bin/linux32/SnippetJointCHECKED

clean_SnippetJoint_checked: 
	@$(ECHO) clean SnippetJoint checked
	@$(RMDIR) $(SnippetJoint_checked_objsdir)
	@$(RMDIR) $(SnippetJoint_checked_bin)
	@$(RMDIR) $(DEPSDIR)/SnippetJoint/checked

build_SnippetJoint_checked: postbuild_SnippetJoint_checked
postbuild_SnippetJoint_checked: mainbuild_SnippetJoint_checked
mainbuild_SnippetJoint_checked: prebuild_SnippetJoint_checked $(SnippetJoint_checked_bin)
prebuild_SnippetJoint_checked:

$(SnippetJoint_checked_bin): $(SnippetJoint_checked_obj) build_SnippetRender_checked build_SnippetUtils_checked 
	mkdir -p `dirname ./../../../Bin/linux32/SnippetJointCHECKED`
	$(CCLD) $(SnippetJoint_checked_obj) $(SnippetJoint_checked_lflags) -o $(SnippetJoint_checked_bin) 
	$(ECHO) building $@ complete!

SnippetJoint_checked_DEPDIR = $(dir $(@))/$(*F)
$(SnippetJoint_checked_cpp_o): $(SnippetJoint_checked_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling checked $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cppfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_checked_cppflags) -c $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cppfiles)) -o $@
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cppfiles))))))
	cp $(SnippetJoint_checked_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_checked_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  rm -f $(SnippetJoint_checked_DEPDIR).d

$(SnippetJoint_checked_cc_o): $(SnippetJoint_checked_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling checked $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_ccfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_checked_cppflags) -c $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_ccfiles)) -o $@
	mkdir -p $(dir $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_ccfiles))))))
	cp $(SnippetJoint_checked_DEPDIR).d $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_ccfiles))))).checked.P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_checked_DEPDIR).d >> $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_ccfiles))))).checked.P; \
	  rm -f $(SnippetJoint_checked_DEPDIR).d

$(SnippetJoint_checked_c_o): $(SnippetJoint_checked_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling checked $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cfiles))...
	mkdir -p $(dir $(@))
	$(CC) $(SnippetJoint_checked_cflags) -c $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cfiles)) -o $@ 
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cfiles))))))
	cp $(SnippetJoint_checked_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_checked_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/checked/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_checked_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  rm -f $(SnippetJoint_checked_DEPDIR).d

SnippetJoint_profile_hpaths    := 
SnippetJoint_profile_hpaths    += ./../../../Include
SnippetJoint_profile_lpaths    := 
SnippetJoint_profile_lpaths    += ./../../../Lib/linux32
SnippetJoint_profile_lpaths    += ./../../lib/linux32
SnippetJoint_profile_lpaths    += ./../../../Bin/linux32
SnippetJoint_profile_lpaths    += ./../../lib/linux32
SnippetJoint_profile_defines   := $(SnippetJoint_custom_defines)
SnippetJoint_profile_defines   += PHYSX_PROFILE_SDK
SnippetJoint_profile_defines   += RENDER_SNIPPET
SnippetJoint_profile_defines   += NDEBUG
SnippetJoint_profile_defines   += PX_PROFILE
SnippetJoint_profile_defines   += PX_SUPPORT_VISUAL_DEBUGGER
SnippetJoint_profile_libraries := 
SnippetJoint_profile_libraries += SnippetRenderPROFILE
SnippetJoint_profile_libraries += SnippetUtilsPROFILE
SnippetJoint_profile_libraries += PhysX3PROFILE_x86
SnippetJoint_profile_libraries += PhysX3CommonPROFILE_x86
SnippetJoint_profile_libraries += PhysX3CookingPROFILE_x86
SnippetJoint_profile_libraries += PhysX3CharacterKinematicPROFILE_x86
SnippetJoint_profile_libraries += PhysX3ExtensionsPROFILE
SnippetJoint_profile_libraries += PhysX3VehiclePROFILE
SnippetJoint_profile_libraries += PhysXProfileSDKPROFILE
SnippetJoint_profile_libraries += PhysXVisualDebuggerSDKPROFILE
SnippetJoint_profile_libraries += PxTaskPROFILE
SnippetJoint_profile_libraries += SnippetUtilsPROFILE
SnippetJoint_profile_libraries += SnippetRenderPROFILE
SnippetJoint_profile_libraries += GL
SnippetJoint_profile_libraries += GLU
SnippetJoint_profile_libraries += glut
SnippetJoint_profile_libraries += X11
SnippetJoint_profile_libraries += rt
SnippetJoint_profile_libraries += pthread
SnippetJoint_profile_common_cflags	:= $(SnippetJoint_custom_cflags)
SnippetJoint_profile_common_cflags    += -MMD
SnippetJoint_profile_common_cflags    += $(addprefix -D, $(SnippetJoint_profile_defines))
SnippetJoint_profile_common_cflags    += $(addprefix -I, $(SnippetJoint_profile_hpaths))
SnippetJoint_profile_common_cflags  += -m32
SnippetJoint_profile_common_cflags  += -Werror -m32 -fPIC -msse2 -mfpmath=sse -malign-double -ffast-math -fno-exceptions -fno-rtti -fvisibility=hidden -fvisibility-inlines-hidden
SnippetJoint_profile_common_cflags  += -Wall -Wextra -Wstrict-aliasing=2 -fdiagnostics-show-option
SnippetJoint_profile_common_cflags  += -Wno-long-long
SnippetJoint_profile_common_cflags  += -Wno-unknown-pragmas -Wno-invalid-offsetof -Wno-uninitialized
SnippetJoint_profile_common_cflags  += -Wno-unused-parameter
SnippetJoint_profile_common_cflags  += -O3 -fno-strict-aliasing
SnippetJoint_profile_cflags	:= $(SnippetJoint_profile_common_cflags)
SnippetJoint_profile_cppflags	:= $(SnippetJoint_profile_common_cflags)
SnippetJoint_profile_lflags    := $(SnippetJoint_custom_lflags)
SnippetJoint_profile_lflags    += $(addprefix -L, $(SnippetJoint_profile_lpaths))
SnippetJoint_profile_lflags    += -Wl,--start-group $(addprefix -l, $(SnippetJoint_profile_libraries)) -Wl,--end-group
SnippetJoint_profile_lflags  += -lrt
SnippetJoint_profile_lflags  += -Wl,-rpath ./
SnippetJoint_profile_lflags  += -m32
SnippetJoint_profile_objsdir  = $(OBJS_DIR)/SnippetJoint_profile
SnippetJoint_profile_cpp_o    = $(addprefix $(SnippetJoint_profile_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.o, $(SnippetJoint_cppfiles)))))
SnippetJoint_profile_cc_o    = $(addprefix $(SnippetJoint_profile_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.o, $(SnippetJoint_ccfiles)))))
SnippetJoint_profile_c_o      = $(addprefix $(SnippetJoint_profile_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.o, $(SnippetJoint_cfiles)))))
SnippetJoint_profile_obj      = $(SnippetJoint_profile_cpp_o) $(SnippetJoint_profile_cc_o) $(SnippetJoint_profile_c_o)
SnippetJoint_profile_bin      := ./../../../Bin/linux32/SnippetJointPROFILE

clean_SnippetJoint_profile: 
	@$(ECHO) clean SnippetJoint profile
	@$(RMDIR) $(SnippetJoint_profile_objsdir)
	@$(RMDIR) $(SnippetJoint_profile_bin)
	@$(RMDIR) $(DEPSDIR)/SnippetJoint/profile

build_SnippetJoint_profile: postbuild_SnippetJoint_profile
postbuild_SnippetJoint_profile: mainbuild_SnippetJoint_profile
mainbuild_SnippetJoint_profile: prebuild_SnippetJoint_profile $(SnippetJoint_profile_bin)
prebuild_SnippetJoint_profile:

$(SnippetJoint_profile_bin): $(SnippetJoint_profile_obj) build_SnippetRender_profile build_SnippetUtils_profile 
	mkdir -p `dirname ./../../../Bin/linux32/SnippetJointPROFILE`
	$(CCLD) $(SnippetJoint_profile_obj) $(SnippetJoint_profile_lflags) -o $(SnippetJoint_profile_bin) 
	$(ECHO) building $@ complete!

SnippetJoint_profile_DEPDIR = $(dir $(@))/$(*F)
$(SnippetJoint_profile_cpp_o): $(SnippetJoint_profile_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling profile $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cppfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_profile_cppflags) -c $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cppfiles)) -o $@
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cppfiles))))))
	cp $(SnippetJoint_profile_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_profile_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  rm -f $(SnippetJoint_profile_DEPDIR).d

$(SnippetJoint_profile_cc_o): $(SnippetJoint_profile_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling profile $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_ccfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_profile_cppflags) -c $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_ccfiles)) -o $@
	mkdir -p $(dir $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_ccfiles))))))
	cp $(SnippetJoint_profile_DEPDIR).d $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_ccfiles))))).profile.P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_profile_DEPDIR).d >> $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_ccfiles))))).profile.P; \
	  rm -f $(SnippetJoint_profile_DEPDIR).d

$(SnippetJoint_profile_c_o): $(SnippetJoint_profile_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling profile $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cfiles))...
	mkdir -p $(dir $(@))
	$(CC) $(SnippetJoint_profile_cflags) -c $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cfiles)) -o $@ 
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cfiles))))))
	cp $(SnippetJoint_profile_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_profile_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/profile/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_profile_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  rm -f $(SnippetJoint_profile_DEPDIR).d

SnippetJoint_release_hpaths    := 
SnippetJoint_release_hpaths    += ./../../../Include
SnippetJoint_release_lpaths    := 
SnippetJoint_release_lpaths    += ./../../../Lib/linux32
SnippetJoint_release_lpaths    += ./../../lib/linux32
SnippetJoint_release_lpaths    += ./../../../Bin/linux32
SnippetJoint_release_lpaths    += ./../../lib/linux32
SnippetJoint_release_defines   := $(SnippetJoint_custom_defines)
SnippetJoint_release_defines   += PHYSX_PROFILE_SDK
SnippetJoint_release_defines   += RENDER_SNIPPET
SnippetJoint_release_defines   += NDEBUG
SnippetJoint_release_libraries := 
SnippetJoint_release_libraries += SnippetRender
SnippetJoint_release_libraries += SnippetUtils
SnippetJoint_release_libraries += PhysX3_x86
SnippetJoint_release_libraries += PhysX3Common_x86
SnippetJoint_release_libraries += PhysX3Cooking_x86
SnippetJoint_release_libraries += PhysX3CharacterKinematic_x86
SnippetJoint_release_libraries += PhysX3Extensions
SnippetJoint_release_libraries += PhysX3Vehicle
SnippetJoint_release_libraries += PhysXProfileSDK
SnippetJoint_release_libraries += PhysXVisualDebuggerSDK
SnippetJoint_release_libraries += PxTask
SnippetJoint_release_libraries += SnippetUtils
SnippetJoint_release_libraries += SnippetRender
SnippetJoint_release_libraries += GL
SnippetJoint_release_libraries += GLU
SnippetJoint_release_libraries += glut
SnippetJoint_release_libraries += X11
SnippetJoint_release_libraries += rt
SnippetJoint_release_libraries += pthread
SnippetJoint_release_common_cflags	:= $(SnippetJoint_custom_cflags)
SnippetJoint_release_common_cflags    += -MMD
SnippetJoint_release_common_cflags    += $(addprefix -D, $(SnippetJoint_release_defines))
SnippetJoint_release_common_cflags    += $(addprefix -I, $(SnippetJoint_release_hpaths))
SnippetJoint_release_common_cflags  += -m32
SnippetJoint_release_common_cflags  += -Werror -m32 -fPIC -msse2 -mfpmath=sse -malign-double -ffast-math -fno-exceptions -fno-rtti -fvisibility=hidden -fvisibility-inlines-hidden
SnippetJoint_release_common_cflags  += -Wall -Wextra -Wstrict-aliasing=2 -fdiagnostics-show-option
SnippetJoint_release_common_cflags  += -Wno-long-long
SnippetJoint_release_common_cflags  += -Wno-unknown-pragmas -Wno-invalid-offsetof -Wno-uninitialized
SnippetJoint_release_common_cflags  += -Wno-unused-parameter
SnippetJoint_release_common_cflags  += -O3 -fno-strict-aliasing
SnippetJoint_release_cflags	:= $(SnippetJoint_release_common_cflags)
SnippetJoint_release_cppflags	:= $(SnippetJoint_release_common_cflags)
SnippetJoint_release_lflags    := $(SnippetJoint_custom_lflags)
SnippetJoint_release_lflags    += $(addprefix -L, $(SnippetJoint_release_lpaths))
SnippetJoint_release_lflags    += -Wl,--start-group $(addprefix -l, $(SnippetJoint_release_libraries)) -Wl,--end-group
SnippetJoint_release_lflags  += -lrt
SnippetJoint_release_lflags  += -Wl,-rpath ./
SnippetJoint_release_lflags  += -m32
SnippetJoint_release_objsdir  = $(OBJS_DIR)/SnippetJoint_release
SnippetJoint_release_cpp_o    = $(addprefix $(SnippetJoint_release_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cpp, %.cpp.o, $(SnippetJoint_cppfiles)))))
SnippetJoint_release_cc_o    = $(addprefix $(SnippetJoint_release_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.cc, %.cc.o, $(SnippetJoint_ccfiles)))))
SnippetJoint_release_c_o      = $(addprefix $(SnippetJoint_release_objsdir)/, $(subst ./, , $(subst ../, , $(patsubst %.c, %.c.o, $(SnippetJoint_cfiles)))))
SnippetJoint_release_obj      = $(SnippetJoint_release_cpp_o) $(SnippetJoint_release_cc_o) $(SnippetJoint_release_c_o)
SnippetJoint_release_bin      := ./../../../Bin/linux32/SnippetJoint

clean_SnippetJoint_release: 
	@$(ECHO) clean SnippetJoint release
	@$(RMDIR) $(SnippetJoint_release_objsdir)
	@$(RMDIR) $(SnippetJoint_release_bin)
	@$(RMDIR) $(DEPSDIR)/SnippetJoint/release

build_SnippetJoint_release: postbuild_SnippetJoint_release
postbuild_SnippetJoint_release: mainbuild_SnippetJoint_release
mainbuild_SnippetJoint_release: prebuild_SnippetJoint_release $(SnippetJoint_release_bin)
prebuild_SnippetJoint_release:

$(SnippetJoint_release_bin): $(SnippetJoint_release_obj) build_SnippetRender_release build_SnippetUtils_release 
	mkdir -p `dirname ./../../../Bin/linux32/SnippetJoint`
	$(CCLD) $(SnippetJoint_release_obj) $(SnippetJoint_release_lflags) -o $(SnippetJoint_release_bin) 
	$(ECHO) building $@ complete!

SnippetJoint_release_DEPDIR = $(dir $(@))/$(*F)
$(SnippetJoint_release_cpp_o): $(SnippetJoint_release_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling release $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cppfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_release_cppflags) -c $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cppfiles)) -o $@
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cppfiles))))))
	cp $(SnippetJoint_release_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_release_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cpp.o,.cpp, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cppfiles))))).P; \
	  rm -f $(SnippetJoint_release_DEPDIR).d

$(SnippetJoint_release_cc_o): $(SnippetJoint_release_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling release $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_ccfiles))...
	mkdir -p $(dir $(@))
	$(CXX) $(SnippetJoint_release_cppflags) -c $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_ccfiles)) -o $@
	mkdir -p $(dir $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_ccfiles))))))
	cp $(SnippetJoint_release_DEPDIR).d $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_ccfiles))))).release.P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_release_DEPDIR).d >> $(addprefix $(DEPSDIR)/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .cc.o,.cc, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_ccfiles))))).release.P; \
	  rm -f $(SnippetJoint_release_DEPDIR).d

$(SnippetJoint_release_c_o): $(SnippetJoint_release_objsdir)/%.o:
	$(ECHO) SnippetJoint: compiling release $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cfiles))...
	mkdir -p $(dir $(@))
	$(CC) $(SnippetJoint_release_cflags) -c $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cfiles)) -o $@ 
	@mkdir -p $(dir $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cfiles))))))
	cp $(SnippetJoint_release_DEPDIR).d $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  sed -e 's/#.*//' -e 's/^[^:]*: *//' -e 's/ *\\$$//' \
		-e '/^$$/ d' -e 's/$$/ :/' < $(SnippetJoint_release_DEPDIR).d >> $(addprefix $(DEPSDIR)/SnippetJoint/release/, $(subst ./, , $(subst ../, , $(filter %$(strip $(subst .c.o,.c, $(subst $(SnippetJoint_release_objsdir),, $@))), $(SnippetJoint_cfiles))))).P; \
	  rm -f $(SnippetJoint_release_DEPDIR).d

clean_SnippetJoint:  clean_SnippetJoint_debug clean_SnippetJoint_checked clean_SnippetJoint_profile clean_SnippetJoint_release
	rm -rf $(DEPSDIR)

export VERBOSE
ifndef VERBOSE
.SILENT:
endif
