cdef extern from "stdlib.h":
    # sort function that takes a pointer to an array and applies a compare function which takes wo two void pointers as arguments
    void qsort(void *array, size_t count, size_t size, int (*compare)(const void *, const void *) except *)
    void *malloc(size_t size)
    void free(void *ptr)


ctypedef int (*qsort_cmp)(const void *, const void *) except *
# module-global Python object to store the Python comparison function
cdef object py_cmp = None

def pyqsort(list x, cmp = None, reverse = False):
    global py_cmp
    cdef:
        int *array
        int i, N
        qsort_cmp cmp_callback
    
    # choosing which comparison function to use
    if cmp and reverse:
        py_cmp = cmp
        cmp_callback = reverse_py_cmp_wrapper
    elif cmp and not reverse:
        py_cmp = cmp
        cmp_callback = py_cmp_wrapper
    elif reverse:
        cmp_callback = reverse_int_compare
    else:
        cmp_callback = int_compare
    
    # allocate the C array
    N = len(x)
    array = <int*>malloc(sizeof(int) * N)
    if array == NULL:
        raise MemoryError("Unable to allocate array.")
    
    # Fill the C array with the Python integers
    for i in range(N):
        array[i] = x[i]
    
    
    # qsort the array
    qsort(<void*>array, <size_t>N, sizeof(int), cmp_callback)
    
    # convert back to python and free the C array
    for i in range(N):
        x[i] = array[i]
    free(array)


# standard sort function, using a compare callback
cdef int int_compare(const void *a, const void*b) except *:
    cdef int ia, ib
    # convert the void pointers into integers
    ia = (<int*>a)[0] # dereference the pointer
    ib = (<int*>b)[0]
    return ia - ib

# expands capability of qsort to allow reverse-sorting the array by negating the return value of int_compare()
cdef int reverse_int_compare(const void *a, const void*b) except *:
    return -int_compare(a, b)

# wraps the python compare function in C so we can pass it to qsort
cdef int py_cmp_wrapper(const void *a, const void *b) except *:
    cdef int ia, ib
    ia = (<int*>a)[0]
    ib = (<int*>b)[0]
    return py_cmp(ia, ib)


cdef int reverse_py_cmp_wrapper(const void *a, const void *b) except *:
    return -py_cmp_wrapper(a, b)


"""
Can run in ipython:

import pyximport; pyximport.install()
from pyqsort import pyqsort

and then do whatever the fuck you want
"""