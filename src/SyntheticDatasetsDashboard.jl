module SyntheticDatasetsDashboard

using Dash
using DashHtmlComponents
using DashCoreComponents
using Plots

using StatsPlots, SyntheticDatasets

function powplot(n_samples, cluster_std)
    blobs = SyntheticDatasets.make_blobs(   n_samples = n_samples, 
                                            n_features = 2,
                                            centers = [-1 1; -0.5 0.5], 
                                            cluster_std = cluster_std,
                                            center_box = (-2.0, 2.0), 
                                            shuffle = true,
                                            random_state = nothing);

    p = @df blobs scatter(:feature_1, :feature_2, group = :label)
    figure = (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
    figure
end

function components_make_blob()
    html_div(id = "div_make_blobs", style = Dict(:display => "None")) do
        html_div() do
            html_div("Samples", style = (width = "10%", display = "inline-block")),
            html_div(dcc_slider(
                id = "n_samples",
                min = 0,
                max = 10000,
                marks = Dict(i => "$i" for i = 0:1000:10000),
                value = 100,
            ), style = (width = "70%", display = "inline-block"))
        end,
        html_div() do
            html_div("Cluster STD", style = (width = "10%", display = "inline-block")),
            html_div(dcc_slider(
                id = "cluster_std",
                min = 0,
                max = 1,
                step = 0.01,
                marks = Dict(i => "$i" for i = 0:0.1:1),
                value = 0.1,
            ), style = (width = "70%", display = "inline-block"))
        end
    end
end

dropdown_options = [
    Dict("label" => "Blobs", "value" => "make_blobs"),
    Dict("label" => "Gaussian Quantiles", "value" => "make_gaussian_quantiles"),
]

app = dash(external_stylesheets = ["https://codepen.io/chriddyp/pen/bWLwgP.css"])

app.layout = html_div(style = Dict(:width => "50%")) do
    html_h1("Synthetic Datasets"),
    html_label("Dropdown"),
    dcc_dropdown(id="function", options = dropdown_options, value = "make_blobs"),
    html_br(),
    components_make_blob(),
    html_br(),
    dcc_graph(id = "power", figure = powplot(1000, 0.25))
end

callback!(app, Output("power", "figure"),[Input("n_samples", "value"), Input("cluster_std", "value")]) do n_samples, cluster_std
    powplot(n_samples, cluster_std)
end

callback!(app, Output("div_make_blobs", "style"),[Input("function", "value")]) do f
    if f == "make_blobs"
        return Dict()
    elseif f == "make_gaussian_quantiles"
        return Dict(:display => "None")
    end
end

end # module
