  [Mesh]
	type = GeneratedMesh
	dim = 1
	nx = 10
	xmin = 0
	xmax = 1
  []

[Variables]
  [T]
	initial_condition = 350 #  so this is in Kelvins, lets try it first 
  []
[]

  [Kernels]
	[heat_conduction]
	type = Diffusion
	variable = T
	[]
  []

  [BCs] #  stands for boundary  conditions
	[left_temp]
	type =  DirichletBC
	variable = T
	boundary = left
	value = 400
	[]
	[right_temp]
	type = DirichletBC
	variable= T
	boundary = right
	value = 300
	[]
  []

  [Executioner]
	type = Steady
	solve_type = NEWTON
  []

  [Outputs]
	exodus = true
	csv = true
  []

  [Postprocessors]
	[center_temperature]
	type = PointValue
	variable = T
	point = '0.5 0 0'
	[]
  []

