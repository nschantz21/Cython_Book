# statically typed Cython implementation of Fib function
def fib(int n):
    cdef int i # static typing using C types
    cdef double a=0.0, b=1.0 # static typing using C types
    for i in range(n):
        a, b = a + b, a
    return a