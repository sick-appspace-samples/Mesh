---------------------------------------------------------------------------
-- All primitive create functions for the Mesh datatype
---------------------------------------------------------------------------

-- Plot properties of the separate mesh objects
local size = 100      -- The longest side on each mesh object
local offset = 120    -- The distance between objects when plotted
local z = 110         -- Set to size/2 to put on baseplane
local a = 0.0         -- Alpha rotation as input to Transform.createRigidAxisAngle3D()
local b = 0.6         -- Beta rotations as input to --||--
local g = 0.3         -- Beta rotations as input to --||--
local normals = false -- Decide id explicit normals should be calculated or not

-- Create all mesh types
local meshes = {}
meshes[#meshes+1] = Mesh.createBox(Shape3D.createBox(size,size,size, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createCircle(Shape3D.createCircle(size/2, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createCone(Shape3D.createCone(size/2, size, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createCylinder(Shape3D.createCylinder(size/2, size, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createEllipse(Shape3D.createEllipse(size/3, size/2, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createEllipticCylinder(Shape3D.createEllipticCylinder(size/3, size/2, size, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createRectangle(Shape3D.createRectangle(size/2, size, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)
meshes[#meshes+1] = Mesh.createSphere(Shape3D.createSphere(size/2, Transform.createRigidEulerXYZ3D(a, b, g, 0, #meshes*offset, z)), normals)

-- Print information
print("Created the following meshes")
for i = 1, #meshes do
  print(string.format("Mesh %d: %s", i, meshes[i]:toString()))
end

-- Create decorator with some color
-- Decide if all or specific faces should be displayed
local decoration = View.MeshDecoration.create()
decoration:setSurfaceColor(200, 100, 30)
decoration:setVisibleFaces("FRONT_AND_BACK")

-- View all generate meshes
local viewer = View.create('viewer3D1')
viewer:clear()
viewer:addMesh(meshes, decoration)
viewer:present()
