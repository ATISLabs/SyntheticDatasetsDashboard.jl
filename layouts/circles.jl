circles = html_div() do
    html_div(id="fields") do
        html_div(className="container-slider") do
            html_label("Samples: "),
            html_div(
                dcc_slider(
                        id = "n_samples",
                        min = 1,
                        max = 10000,
                        marks = Dict(i => "$i" for i = 0:1000:10000),
                        value = 100,
                ),
            style = (width = "70%", display = "inline-block"),
            className = "slider")
        end,
        html_div(className="container-slider") do
            html_label("Noise: "),
            html_div(
                dcc_slider(
                        id = "noise",
                        min = 0.0,
                        max = 1.0,
                        step = 0.01,
                        marks = Dict(i => "$i" for i = 0.0:0.1:1.0),
                        value = 0.1,
                ),
            style = (width = "70%", display = "inline-block"),
            className = "slider")
        end,
        html_div(className="container-slider") do
            html_label("Factor: "),
            html_div(
                dcc_slider(
                        id = "factor",
                        min = 0.0,
                        max = 1.0,
                        step = 0.01,
                        marks = Dict(i => "$i" for i = 0.0:0.1:1.0),
                        value = 0.1,
                ),
            style = (width = "70%", display = "inline-block"),
            className = "slider")
        end
    end,
    html_div(className="container-graph") do
        dcc_graph(
            id = "plot_circles",
            figure = gen_circles(1000, 0.25,0.25) 
        )
    end
end

callback!(app, Output("plot_circles", "figure"),[Input("n_samples", "value"), Input("noise", "value"),Input("factor", "value")]) do n_samples, noise, factor
    gen_circles(n_samples,noise,factor)
end