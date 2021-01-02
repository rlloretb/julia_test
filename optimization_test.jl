using Pkg
Pkg.add("Plots")
Pkg.add("PyPlot")
Pkg.add("GLPK")
Pkg.add("JuMP")
Pkg.add("Gurobi")
Pkg.add("Cbc")
Pkg.add("SCIP")
Pkg.add("Ipopt")


# using random
using JuMP
using Cbc
# using Ipopt
using Plots
plotly() # Choose the Plotly.jl backend for web interactivity
plot(rand(5,5),linewidth=2,title="My Plot")
gui()

# Pkg.add("PyPlot") # Install a different backend
pyplot() # Switch to using the PyPlot.jl backend
plot(rand(5,5),linewidth=2,title="My Plot") # The same plotting command works


model = Model(with_optimizer(Cbc.Optimizer))

@variable(model, 0 <= x <= 2)
@variable(model, 0 <= y <= 30)
@objective(model, Max, 5x + 3 * y)
@constraint(model, con, 1x + 5y <= 3)

optimize!(model)
termination_status(model)

primal_status(model)
dual_status(model)

objective_value(model)

print(objective_value(model))

value(x)
value(y)
print(value(x))

a = 10.0
