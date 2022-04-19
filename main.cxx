#include <iostream>
#include "other.hxx"
import test_module;

using namespace std;

int main() {
	const auto result = hello();
	cout << "hello() returned value: " << result << endl;
	const auto result2 = hi();
	cout << "hi() returned value: " << result2 << endl;
	const auto result3 = foo();
	cout << "foo() returned value: " << result3 << endl;
	bar b;
	const auto result4 = b.barFunc(2);
	cout << "b.barFunc(2) returned value: " << result4 << endl;
	return 0;;
}
