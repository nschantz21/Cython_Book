INCDIR :=$(shell python -c \
		"from distutils import sysconfig; print(sysconfig.get_python_inc())")
LIBS :=$(shell python -c \
		"from distutils import sysconfig; \ 
		print(sysconfig.get_config_var('LIBS'))")

# this is a makefile for cython
# the INCDIR line is to access the include directory for the Python header file Python.h where the Python/C API is declared.
# the LIBS line is to acquire the Python dynamic libraries to link against