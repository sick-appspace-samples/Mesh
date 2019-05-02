---------------------------------------------------------------------------
-- Load a CAD model to a Mesh
-- Activate the "Lighting" option in the viewer to improve the visualization
---------------------------------------------------------------------------

-- Load a ply CAD model
local mesh=Mesh.load("resources/Hinge.ply")

-- Set viewing properties
local decoration = View.MeshDecoration.create()
decoration:setSurfaceColor(200, 100, 30)
decoration:setVisibleFaces("FRONT_AND_BACK")

-- Display it
local viewer = View.create()
viewer:clear()
viewer:addMesh(mesh, decoration)
viewer:present()
