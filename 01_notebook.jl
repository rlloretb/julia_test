url = "https://raw.githubusercontent.com/CSSEGISandData/COVID-19/master/csse_covid_19_data/csse_covid_19_time_series/time_series_covid19_confirmed_global.csv"
download(url, "covid_data.csv")

readdir()

using Pkg   # built-in package manager in Julia: Pkg
# Pkg.add("CSV")   # calls the `add` function from the module Pkg.  This installs a package
# Pkg.add("DataFrames")
# Pkg.add("Interact")
# Pkg.add("Plots")
# Pkg.add("GLMakie")
# Pkg.add("Plotly")


using CSV
using DataFrames
using Plots
using Interact
using Dates
using Plotly
# using GLMakie


data = CSV.read("covid_data.csv", DataFrame)

data_2 = rename(data, 1 => "province", 2 => "country")

@show data_2

rename!(data, 1 => "province", 2 => "country")


for i in 1:10
    @show i
end

typeof(1:10)

collect(1:10)

for i in 1:10
    println("i = ", i)
end

for i in 1:10
    @show i
end

for i in 1:10
    i
end

@manipulate for i in 1:10
    HTML(i^2)
end

countries = collect(data[:, 2])

@manipulate for i in 1:length(countries)
    countries[i]
end


US_row = findfirst(countries .== "US")
US_data_row = data[US_row, :]
US_data = convert(Vector, US_data_row[5:end])


format = Dates.DateFormat("m/d/Y")
date_strings = String.(names(data))[5:end];  # apply String function to each element
dates = parse.(Date, date_strings, format) .+ Year(2000)



plot(dates, US_data, xticks=dates[1:5:end], xrotation=45, leg=:topleft,
    label="US data", m=:o)
xlabel!("date")
ylabel!("confirmed cases in US")
title!("US confirmed COVID-19 cases")
gui()
