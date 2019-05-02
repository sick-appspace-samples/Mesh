---------------------------------------------------------------------------
-- Convert a mesh to polygon shapes (set of triangles) 
---------------------------------------------------------------------------

local mesh = Mesh.load("resources/Hinge.ply")
local polygons = mesh:toPolygons()

local decoration = View.ShapeDecoration.create()
decoration:setFillColor(200, 100, 30, 255)
decoration:setLineColor(0,0,0, 255)
decoration:setLineWidth(2)

local viewer = View.create()
viewer:clear()   
viewer:addShape(polygons, decoration) -- each polygon is a shape3D
viewer:present()