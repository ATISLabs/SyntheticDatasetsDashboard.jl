dropdown_options = [
    Dict("label" => "Blobs", "value" => "make_blobs"),
    Dict("label" => "Gaussian Quantiles", "value" => "make_gaussian_quantiles"),
    Dict("label" => "Moons", "value" => "make_moons"),
    Dict("label" => "Two Spirals", "value" => "make_twospirals"),
    Dict("label" => "Circles", "value" => "make_circles"),
]

app.layout = html_div() do
    html_h1("Synthetic Datasets Dashboard"),
    html_div(id = "link") do
        dcc_dropdown(id="drop", options = dropdown_options, value = "make_blobs")
    end,
    dcc_location(id="url", refresh = false),
    html_div(id="page-content")
end

callback!(app,Output("page-content", "children"),[Input("drop","value")]) do drop
    dropload(drop)
end