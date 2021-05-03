CxxPDELib
=========

Wrapper package for the "old" python/c++ pdelib.
This relies on a local installation of pdelib.


## How to use this package

### Install the C++ pdelib

Check the installation  and the correct PYTHONPATH:

```
$ python3
Python 3.6.12 (default, Dec 02 2020, 09:44:23) [GCC] on linux
Type "help", "copyright", "credits" or "license" for more information.
>>> import pdelib
```

If this runs without errors, your pdelib installation should be found
by Julia.


### Add the WIAS julia registry to your Julia istalltion:
````
pkg> registry add https://github.com/WIAS-BERLIN/WIASJuliaRegistry
````

After that, you can add the package in a standard way via the
Julia package manager.

## Sample usage

### Grid visualization

```
using Pkg
Pkg.add("ExtendableGrids")
Pkg.add("CxxPDELib")

X=collect(0.:1:10)
grid=simplexgrid(X,X,X)
viewer=glviewer()
gridview!(viewer,grid; interact=true)
```


### Function visualization

```
f=map((x,y,z)->sin(x)*cos(y)*z, grid)
scalarview!(viewer,grid,f; interact=true)
```

### General acces to pdelib

CxxPDElib initializes the python object `cxxpdelib`:

```
a=cxxpdelib.asdarray(X)
a._print()
```
