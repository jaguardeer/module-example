.DEFAULT_GOAL: app.exe

ifeq ($(OS),Windows_NT)
SHELL       := pwsh.exe
.SHELLFLAGS := -NoProfile -Command
endif

CXXFLAGS = -std=c++20 -fno-ms-compatibility

%.pcm: %.ixx
	clang++ $(CXXFLAGS) --precompile -x c++-module $<

main.o: main.cxx test_module.pcm
	clang++ $(CXXFLAGS) -fprebuilt-module-path=. -c $<

%.o: %.cxx %.pcm
	clang++ $(CXXFLAGS) -fmodule-file="$(basename $@).pcm" -c $<

%.o: %.cxx
	clang++ $(CXXFLAGS) -c $<


app.exe: main.o test_module.o other.o
	clang++ $^ -o $@

.PHONY: clean

CLEANFILES = main.o app.exe test_module.o test_module.pcm other.o
clean:
	-$(foreach file,$(CLEANFILES),rm $(file) ; )
