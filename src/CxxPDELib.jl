module CxxPDELib
using PyCall
using ExtendableGrids

const cxxpdelib = PyNULL()
const np = PyNULL()



function cxxgrid(g)
    a=Matrix(g[Coordinates]')
    coord=cxxpdelib.asdarray(a)
    cn=cxxpdelib.asiarray(g[CellNodes]')
    cr=cxxpdelib.asiarray(g[CellRegions])
    bfn=cxxpdelib.asiarray(g[BFaceNodes]')
    bfr=cxxpdelib.asiarray(g[BFaceRegions])
    cxxpdelib.gCreate(coord,cn,cr,bfn,bfr)
end


glviewer(;title="pycxxpdelib")=cxxpdelib.glv2Create(title)

function gridview!(viewer,grid; interact=false)
    g=cxxgrid(grid)
    cxxpdelib.g2View(viewer,g)
    if interact
        cxxpdelib.glv2Interact()
    else
        cxxpdelib.glv2Update()
    end
end

function scalarview!(viewer,grid, func; interact=false)
    f=cxxpdelib.asdarray(func)
    xg=cxxgrid(grid)
    space=cxxpdelib.gsCreateFV(xg,4) # 4 ==nodes
    cxxpdelib.da1AssociateSpace(space,f)
    cxxpdelib.a2View(viewer,f)
    if interact
        cxxpdelib.glv2Interact()
    else
        cxxpdelib.glv2Update()
    end
end



function __init__()
    copy!(cxxpdelib, pyimport("pdelib"))
    copy!(np, pyimport("numpy"))
end



export glviewer, gridview!, scalarview!,  cxxpdelib,cxxgrid



end # module
