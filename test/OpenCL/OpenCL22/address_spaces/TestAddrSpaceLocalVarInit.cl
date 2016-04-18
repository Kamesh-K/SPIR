// RUN: %clang_cc1 %s -triple spir-unknown-unknown -cl-std=c++ -emit-llvm -pedantic -verify -O0 -o /dev/null
// RUN: %clang_cc1 %s -triple spir-unknown-unknown -cl-std=c++ -emit-llvm -pedantic -verify -O3 -o /dev/null
// expected-no-diagnostics

struct A {
  A(): m(100) { }
  ~A() { m = 111; }
  int m;
};

__local A globalVar1;
static __local A globalVar2;
__local int globalVar3 = 777;

kernel void worker() {
  __local A localVar1;
  static __local A localVar2;
  __local int localVar3 = 333;
}