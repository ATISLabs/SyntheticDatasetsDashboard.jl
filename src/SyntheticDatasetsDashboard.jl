module SyntheticDatasetsDashboard
using Dash
using DashCoreComponents
using DashHtmlComponents
using SyntheticDatasets
using StatsPlots

app = dash( suppress_callback_exceptions = true, 
            external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"]);

include("functions.jl")
include("index.jl")

include("../layouts/blobs.jl")
include("../layouts/moons.jl")
include("../layouts/gaussian.jl")
include("../layouts/two_spirals.jl")
include("../layouts/circles.jl")


end # module
