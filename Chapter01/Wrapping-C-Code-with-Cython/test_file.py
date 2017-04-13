"""
    this is going to test our new module!
    first we must build the cython module
    use this command in the terminal:
    $    python setup.py build_ext --inplace
    
    then we fuck around with it!
"""

from wrap_fib import fib

print fib(100)
# 3.54224848179262e+20

print fib(1000)
# 4.346655768693743e+208

print fib(2000)
# inf

