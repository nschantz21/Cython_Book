#include "Python.h"
#include "transcendentals.h"
#include <math.h>
#include <stdio.h>

int main(int argc, char **argv)
{
Py_Initialize();
inittranscendentals();
printf("pi**e: %f\n", pow(PI, get_e()));
Py_Finalize();
return 0;
}