using Pkg

Pkg.add("Plots")
Pkg.add("WebIO")

using WebIO
using Plots
using Interact

c = 0.01
λ = 1 + c
T = 10
I = zeros(Int64, T)
I_0 = 1

function run_infection(T=20)  # default
    I = zeros(T)
    I[1] = I_0
    for n in 1:T-1
        I[n+1] = λ * I[n]
    end
    return I
end

I = run_infection()

# plot(I, marker=:o, label="I[n]", legend=:topleft)

methods(run_infection)

# gr()

end_T = 1000
@manipulate for T in slider(1:end_T, value=1)
    I_result = run_infection(T)
    plot(I_result, m=:o)
    xlims!(0, end_T)
    ylims!(0, 10)
end

Plots.backend()

pyplot()
plot(run_infection(1000))

plot(run_infection(1000), yscale=:log10)
