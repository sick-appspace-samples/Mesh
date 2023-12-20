---------------------------------------------------------------------------
-- Convert a mesh to a point cloud
---------------------------------------------------------------------------

local mesh = Mesh.load("resources/Hinge.ply")
local cloud = mesh:toPointCloud()

local decoration = View.MeshDecoration.create()
decoration:setSurfaceColor(200, 100, 30)
decoration:setVisibleFaces("FRONT_AND_BACK")

local viewer = View.create('viewer3D1')
viewer:clear()
viewer:addMesh(mesh, decoration)
viewer:addPointCloud(cloud)
viewer:present()