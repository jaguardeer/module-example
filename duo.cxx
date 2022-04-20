#include <iostream>
import single;


using namespace std;

int main() {
	templMod<int> fooA(5);
	fooA.print();
	templMod<double> fooB(69.420);
	fooB.print();
//	templMod fooC("hello");
//	fooC.print();
	cout << singleFunc() << endl;
	cout << fooA.print() << endl;
	cout << fooB.print() << endl;
}
