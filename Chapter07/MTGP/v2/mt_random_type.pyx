
# declaring the externally defined functions, type defs and structs
cdef extern from "mt19937ar-struct.h":
    ctypedef struct mt_state: # typedef
        pass # opaque type
    mt_state *make_mt(unsigned long s) # memory allocator
    void free_mt(mt_state *state) # memory deallocator
    double genrand_real1(mt_state *state) # random number generator

cdef class MT:
    """
    python interface to the imported mt_state struct
    """
    cdef mt_state *_thisptr
    def __cinit__(self, unsigned long s):
        self._thisptr = make_mt(s)
        if self._thisptr == NULL:
            msg = "insufficient memory"
            raise MemoryError(msg)
    def __dealloc__(self):
        if self._thisptr != NULL:
            free_mt(self._thisptr)
    cpdef double rand(self):
        return genrand_real1(self._thisptr)

