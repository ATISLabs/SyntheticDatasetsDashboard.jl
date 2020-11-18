moons = html_div() do
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
        html_label("noise: "),
        html_div(
            dcc_slider(
                    id = "noise",
                    min = 0.00,
                    max = 1.0,
                    step = 0.01,
                    marks = Dict(i => "$i" for i = 0.0:0.1:1.0),
                    value = 0.1,
            ),
        style = (width = "70%", display = "inline-block"))
    end,
    dcc_graph(
        id = "plot_moons",
        figure = gen_moons(1000, 0.25)
    )
end
callback!(app, Output("plot_moons", "figure"),[Input("n_samples", "value"), Input("noise", "value")]) do n_samples, noise
    gen_moons(n_samples,noise)
end