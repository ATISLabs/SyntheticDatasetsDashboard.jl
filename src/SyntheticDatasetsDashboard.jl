module SyntheticDatasetsDashboard
using Dash
using DashCoreComponents
using DashHtmlComponents
using SyntheticDatasets
using StatsPlots

app = dash( suppress_callback_exceptions = true );

app.title = "Synthetic Datasets Dashboard";

app.index_string = """<!DOCTYPE html>
<html>
    <head>
        {%metas%}
        <title>{%title%}</title>
        {%css%}
    </head>
    <body>
        <div id="tested"></div>
        {%app_entry%}
        <footer>
            {%config%}
            {%scripts%}
            {%renderer%}
        </footer>
    </body>
</html>"""

include("functions.jl")
include("index.jl")

include("../layouts/blobs.jl")
include("../layouts/moons.jl")
include("../layouts/gaussian.jl")
include("../layouts/two_spirals.jl")
include("../layouts/circles.jl")


end # module
