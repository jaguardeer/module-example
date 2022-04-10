%.pcm: %.ixx
	clang++ -std=c++20 --precompile -x c++-module $<

main.o: main.cxx test_module.pcm
	clang++ -std=c++20 -fprebuilt-module-path=. -c $<

%.o: %.cxx %.pcm
	clang++ -std=c++20 -fmodule-file=$(basename $@).pcm -c $<

%.o: %.cxx
	clang++ -std=c++20 -c $<


app.exe: main.o test_module.o other.o
	clang++ $^ -o $@

.PHONY: clean

clean:
	rm main.o app.exe test_module.o test_module.pcm other.o
