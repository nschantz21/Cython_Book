# example setup file for wrap_fib module made in Chapter01
from distutils.core import setup, Extension
from Cython.build import cythonize

# first create an Extension object with the appropriate name and sources.
ext = Extension(name="wrap_fib", sources=["cfib.c", "wrap_fib.pyx"])

# Use cythonize on the extension object
setup(ext_modules = cythonize(ext))

"""
to run this:
$ python setup.py build_ext --inplace

The build_ext argument is a command instructing distutils to build the Extension
object or objects that the cythonize call created

he optional --inplace flag instructs
distutils to place each extension module next to its respective Cython .pyx source file.
"""