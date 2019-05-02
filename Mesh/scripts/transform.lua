---------------------------------------------------------------------------
-- Transforming a mesh
---------------------------------------------------------------------------

local transform = Transform.createTranslation3D(0, 0, 100)
local mesh = Mesh.load("resources/Hinge.ply")
local transformedMesh = mesh:transform(transform)
local transform2 = Transform.createTranslation3D(100, 0, 100)

--inplace transformation
local mesh2 = Mesh.clone(mesh)
mesh2:transformInplace(transform2)

local decoration = View.MeshDecoration.create()
decoration:setSurfaceColor(200, 100, 30)
decoration:setVisibleFaces("FRONT_AND_BACK")

local decorationTransformed = View.MeshDecoration.create()
decorationTransformed:setSurfaceColor(30, 200, 100)
decorationTransformed:setVisibleFaces("FRONT_AND_BACK")

local decoration2 = View.MeshDecoration.create()
decoration2:setSurfaceColor(30, 100, 200)
decoration2:setVisibleFaces("FRONT_AND_BACK")

local viewer = View.create()
viewer:clear()   
viewer:addMesh(mesh, decoration)
viewer:addMesh(transformedMesh, decorationTransformed)
viewer:addMesh(mesh2, decoration2)
viewer:present()