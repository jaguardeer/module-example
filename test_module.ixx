/*
		This file is the primary module interface unit
*/

export module test_module; // this is the name of the module

export int hello();        // this exposes hello() to anyone that imports test_module
                           // hello() is implemented in test_module.cxx
