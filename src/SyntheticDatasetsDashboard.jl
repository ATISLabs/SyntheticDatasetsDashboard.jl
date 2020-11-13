module SyntheticDatasetsDashboard
using Dash
using DashCoreComponents
using DashHtmlComponents
using SyntheticDatasets
using StatsPlots

app = dash( suppress_callback_exceptions = true, 
            external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]);

include("functions.jl")
include("layouts.jl")
include("index.jl")

end # module
