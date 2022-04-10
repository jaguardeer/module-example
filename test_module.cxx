module; // this starts the global module fragment

// put include in here
#include <iostream>

module test_module;

using namespace std;

int hello() {
	cout << "hello!!!" << endl;
	return 1337;
}

double hi() {
	cout << "hi!" << endl;
	return 69.420;
}
