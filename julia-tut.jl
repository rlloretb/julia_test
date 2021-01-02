using Printf
using Statistics
#using Cxx


s = 0
s = "Dog"
println(s)


# Comments
# one-line comment
s3 = """I have
many lines"""


# String Comparison
println("T" > "HA")
println(findfirst(isequal('i'), "Keigo"))
println(occursin("key", "monkey"))

# Conditionals

age = 12

# operators: > < >= <= == != && || !

if age >= 5 && age <= 6
    println("You are in kindergarten")
elseif age >= 7 && age <= 13
    println("You are in middle school")
elseif age >= 14 && age <= 18
    println("You are in high school")
else
    println("Stay home")
end


@printf("true || false %s\n", true || false ? "true" : "false")
@printf("!true = %s\n", !true ? "true" : "false")


# looping

i = 1
while i < 20
    if (i % 2) == 0
        println(i)
        global i += 1
        continue
    end
    global i += 1
    if i >= 10
        break
    end
end


for i = 1:5
    println(i)
end

for i in [2,4,6]
    println(i)
end

for i in 1:5, j = 2:2:10
    println((i,j))
end


# arrays
a1 = zeros(Int32, 2, 2)
a2 = Array{Int32}(undef, 5)
a3 = Float64[]
a4 = [1,2,3]

print(a4[1])
println(a4[end])
println(5 in a4)
println(findfirst(isequal(2), a4))
f(a) = (a >= 2) ? true : false
println(findall(f, a4))
println(count(f, a4))

println(size(a4))
println(length(a4))
println(sum(a4))
splice!(a4, 2:1, [8,9])
println(a4)
splice!(a4, 2:3)
println(a4)
println(maximum(a4))
println(minimum(a4))
println(a4 * 2)
println(a4)

a5 = [1, 3.14, "Hello"]

a6 = [sin, cos, tan]


"""Calculate area of circle of radius `r`."""
function area(r)
    A = π * r^2
    return A
end


function square_root(n)
    found = 0
    for i in 1:n
        if i^2 >= abs(n) # \ge<TAB> or >=
            found = i # i doesn't exist outside loop
            break
        end
    end
    if found^2 == n
        return(found, :exact)
    else
        return(found, :not_exact)
    end
end


x = 0.0

for i in 1:10
    global x +=0.1 # `global` not needed inside a function
    @show x # prefer @show instead of print
end

x, (x == 1.0)


factorials = [factorial(big(n)) for n in 1:21]
