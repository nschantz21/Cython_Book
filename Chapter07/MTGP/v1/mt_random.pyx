
"""
 Mersenne Twister is basically for Monte-Carlo simulations - it is not cryptographically secure "as is".
"""
# declaring the externally defined functions
# this will generate a #include "mt19937ar.h" line in the new source file
cdef extern from "mt19937ar.h":
    void init_genrand(unsigned long s) # these are the function declarations
    double genrand_real1()
    
# We must provide def or cpdef functions so that these declarations can be called from Python
def init_state(unsigned long s):
    """
    simply wrapping the C function with a python def
    """
    init_genrand(s)

def rand():
    """
    python accessible random number generator
    """
    return genrand_real1()