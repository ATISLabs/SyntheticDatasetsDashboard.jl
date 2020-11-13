#BLOBS
blobs = html_div() do   
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
        html_label("Cluster STD: "),
        html_div(
            dcc_slider(
                    id = "cluster_std",
                    min = 0.01,
                    max = 1.0,
                    step = 0.01,
                    marks = Dict(i => "$i" for i = 0.0:0.1:1.0),
                    value = 0.1,
            ),
        style = (width = "70%", display = "inline-block"))
    end,
    dcc_graph(
        id = "plot_blobs",
        figure = gen_plot(1000, 0.25)
    )
end

callback!(app, Output("plot_blobs", "figure"),[Input("n_samples", "value"), Input("cluster_std", "value")]) do n_samples, cluster_std
    gen_plot(n_samples, cluster_std)
end

#Gaussian Quantiles
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
        style = (width = "70%", display = "inline-block"))
    end,
    dcc_graph(
        id = "plot_gaussian",
        figure = gen_gaussian(1000, 0.25)
    )
end

callback!(app, Output("plot_gaussian", "figure"),[Input("n_samples", "value"), Input("cov", "value")]) do n_samples, cov
    gen_gaussian(n_samples, cov)
end
