module;

import <iostream>;

export module single;

export const char* singleFunc();

export template<class T>
class templMod {
	public:
		templMod(T t) : val{t} {}
		//T print() { val += 5; c("%p", &val); return val; }
		T print() { std::cout << val << std::endl; return val; }
	private:
		T val;
};
