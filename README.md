# MOOSE Thermal Modeling

A collection of reproducible finite element modeling exercises using the Idaho National Laboratory's Multiphysics Object-Oriented Simulation Environment (MOOSE), with postprocessing and scientific visualization in ParaView.

## Project 01 — One-Dimensional Steady-State Heat Conduction

### Objective

Solve and verify a one-dimensional steady-state heat conduction problem with prescribed temperatures at both ends of a rod.

### Mathematical Model

The governing equation for constant thermal conductivity and no internal heat generation is:

**d²T/dx² = 0**

Boundary conditions:

- Left boundary: T(0) = 400 K
- Right boundary: T(1 m) = 300 K

The analytical solution is:

**T(x) = 400 − 100x**, where x is measured in meters and T in kelvin.

### Numerical Implementation

| Parameter | Specification |
|---|---|
| Framework | MOOSE |
| Mesh | 1D generated mesh |
| Elements | 10 |
| Degrees of freedom | 11 |
| Finite element family | FIRST-order LAGRANGE |
| Governing operator | Diffusion |
| Boundary conditions | Dirichlet |
| Executioner | Steady |
| Solver | NEWTON |
| Visualization | ParaView |

The built-in Diffusion kernel is used with a unit diffusion coefficient. Material-specific thermal conductivity is not included in this introductory example.

### Results and Verification

The simulation converged successfully.

At the center of the rod (x = 0.5 m):

- Analytical temperature: **350 K**
- MOOSE-computed temperature: **350 K**

The computed temperature profile is linear, consistent with the analytical solution.

This exercise provides a basic numerical verification case, not validation against experimental data.

### Reproducibility

From the example directory, run:

`moose -i ex_1.i`

The Exodus output can be visualized using ParaView. A PointValue postprocessor evaluates the center temperature.

### Visualization

The temperature profile is obtained using ParaView's Plot Over Line filter.

A Tube filter can also be used to display the 1D solution on a cylindrical surface. This is a visualization technique and **does not constitute a three-dimensional heat conduction simulation**.

### References

1. Incropera et al., *Fundamentals of Heat and Mass Transfer*, 6th edition, 2007.
2. [MOOSE Documentation](https://mooseframework.inl.gov/)
3. [ParaView](https://www.paraview.org/)
