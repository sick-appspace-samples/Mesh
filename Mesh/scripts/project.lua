---------------------------------------------------------------------------
-- Project points onto Mesh
---------------------------------------------------------------------------

local mesh = Mesh.load("resources/Hinge.ply")
local points = {
  Point.create(420, 720, 550),
}

-- Perform approximate and exact projection
local approx = mesh:projectOntoMesh(points, true)
local exact = mesh:projectOntoMesh(points, false)

-- Create lines for visualization
local lineApprox = Shape3D.createLineSegment(points[1], approx[1])
local lineExact = Shape3D.createLineSegment(points[1], exact[1])

-- View the result
local decoration = View.MeshDecoration.create()
decoration:setSurfaceColor(200, 100, 30)
decoration:setVisibleFaces("FRONT_AND_BACK")

local pointDecoration = View.ShapeDecoration.create()
pointDecoration:setPointSize(30)

local approxDecoration = View.ShapeDecoration.create()
approxDecoration:setLineColor(255, 0, 0)
approxDecoration:setLineWidth(10)

local exactDecoration = View.ShapeDecoration.create()
exactDecoration:setLineColor(0, 255, 0)
exactDecoration:setLineWidth(10)

local viewer = View.create('viewer3D1')
viewer:clear()
viewer:addMesh(mesh, decoration)
viewer:addShape({points[1], approx[1], exact[1]}, pointDecoration)
viewer:addShape(lineApprox, approxDecoration)
viewer:addShape(lineExact, exactDecoration)
viewer:present()