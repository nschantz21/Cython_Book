# use pyximport to allow the import statement to recognize .pyx extensions, send them through the compliation pipeline automatically, then import the extension module

import pyximport
pyximport.install() # .install() called before importing
                    # Cython extension modules

import fib # our fib extension module
fib.fib(n) # Fibonnaci function
