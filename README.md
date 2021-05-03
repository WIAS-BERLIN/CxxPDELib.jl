CxxPDELib
=========

Wrapper package for the "old" python/c++ pdelib.
This relies on a local installation of pdelib.


## How to use this package

Add the WIAS julia registry to your Julia istalltion:
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
gridview!(viewer,grid; interactive=true)
```


### Function visualization

```

f=map((x,y,z)->sin(x)*cos(y)*z, grid)

scalarview!(viewer,grid,f; interactive=true)

```
