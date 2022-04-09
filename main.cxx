#include <iostream>
import test_module;

using namespace std;

int main() {
	auto result = hello();
	cout << "hello() returned value: " << result << endl;
	return 0;
}
