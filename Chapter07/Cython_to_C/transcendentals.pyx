"""
 using the public declarations causes cython to generate a hader file in addition to the extension module.
 To make the extension module and header: 
 $ cython transcendentals.pyx
 
 Then make your C file main.c or whatever
 to compile:
 $ gcc $(python-config --cflags) \
    $(python-config --ldflags) \
    transcendentals.c main.c
    -lm \ # link the math library
    -I /home/username/python/include \ # make gcc aware of Python.h
    -L /home/username/python/lib \ # link the python library file path
    -lpython2.7 # link the python library
"""
cdef public double PI = 3.1415926

cdef public double get_e():
    print "calling get_e()"
    return 2.718281828