gaussian = html_div() do
    html_div(id="fields") do
        html_label("Samples: "),
        html_div(
            dcc_slider(
                    id = "n_samples",
                    min = 1,
                    max = 10000,
                    marks = Dict(i => "$i" for i = 0:1000:10000),
                    value = 100,
            ),
        style = (width = "70%", display = "inline-block")),
        html_label("Cov: "),
        html_div(
            dcc_slider(
                    id = "cov",
                    min = 0.01,
                    max = 1.0,
                    step = 0.01,
                    marks = Dict(i => "$i" for i = 0.0:0.1:1.0),
                    value = 0.1,
            ),
        style = (width = "70%", display = "inline-block")),
        html_label("Classes: "),
        html_div(
            dcc_slider(
                    id = "n_classes",
                    min = 1,
                    max = 30,
                    marks = Dict(i => "$i" for i = 0:1:30),
                    value = 2,
            ),
        style = (width = "70%", display = "inline-block"))
    end,
    dcc_graph(
        id = "plot_gaussian",
        figure = gen_gaussian(1000, 0.25,2) 
    )
end

callback!(app, Output("plot_gaussian", "figure"),[Input("n_samples", "value"), Input("cov", "value"),Input("n_classes", "value")]) do n_samples, cov, n_classes
    gen_gaussian(n_samples, cov,n_classes)
end