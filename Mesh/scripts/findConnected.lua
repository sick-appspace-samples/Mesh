---------------------------------------------------------------------------
-- Find connected regions in a Mesh
---------------------------------------------------------------------------

-- Load a point cloud
local pointCloud = PointCloud.load("resources/Box.ply")

-- Reconstruct a mesh
local mesh = Mesh.createFromPointCloud(pointCloud)
print("Complete mesh: " .. mesh:toString())

-- Separate meshes
local components = Mesh.findConnected(mesh)
print("Number of separate meshes found:" .. #components)
   
-- View result
decoration1 = View.MeshDecoration.create()
decoration1:setSurfaceColor(200, 100, 30)
decoration2 = View.MeshDecoration.create()
decoration2:setSurfaceColor(100, 200, 30)
decoration3 = View.MeshDecoration.create()
decoration3:setSurfaceColor(30, 100, 200)

local viewer = View.create()
viewer:clear()   
viewer:addMesh(components[1], decoration1)
viewer:addMesh(components[2], decoration2)
viewer:addMesh(components[3], decoration3)
viewer:present()
