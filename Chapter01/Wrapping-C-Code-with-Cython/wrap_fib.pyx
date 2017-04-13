# distutils: sources = cfib.c
cdef extern from "cfib.h":
    double cfib(int n)

def fib(n):
    # Returns the nth Fibonacci Number
    return cfib(n)