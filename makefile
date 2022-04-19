.DEFAULT_GOAL := app.exe

ifeq ($(OS),Windows_NT)
SHELL       := pwsh.exe
.SHELLFLAGS := -NoProfile -Command
endif

CXXFLAGS = -std=c++20 -fno-ms-compatibility


# clang++ module flags:
# ms-compatibility : mvcs compatibility
# module-file-deps : ??
# module-dependency-dir : ??
# module-file-info : dumps a bunch of garbage to stdout
# module-file : load a module file
# prebuilt-module-path : load modules in this path
# cxx-modules : enable modules

%.pcm: %.ixx
	clang++ $(CXXFLAGS) $(call emitCCJ,$@) --precompile -x c++-module $<

main.o: main.cxx test_module.pcm
	clang++ $(CXXFLAGS) $(call emitCCJ,$@) -fprebuilt-module-path=. -c $<

%.o: %.cxx %.pcm
	clang++ $(CXXFLAGS) $(call emitCCJ,$@) -fmodule-file="$(basename $@).pcm" -c $<

%.o: %.cxx
	clang++ $(CXXFLAGS) $(call emitCCJ,$@) -c $<

app.exe: main.o test_module.o other.o
	clang++ $^ -o $@


.PHONY: clean

CCJDIR = ./dep
emitCCJ = -MJ ./dep/$1.json
compile_commands.json: app.exe | $(CCJDIR)
	echo "[" >$@
	cat ./dep/* >>$@
	echo "]" >>$@

$(CCJDIR):
	mkdir -p $@

CLEANFILES = main.o app.exe test_module.o test_module.pcm other.o
clean:
	-$(foreach file,$(CLEANFILES),rm $(file) ; )
