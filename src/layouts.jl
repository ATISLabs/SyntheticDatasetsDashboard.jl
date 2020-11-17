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

#Moons
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

#Two Spirals
spirals = html_div() do
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
        html_label("Start Degrees: "),
        html_div(
            dcc_slider(
                    id = "start_degrees",
                    min = 0,
                    max = 1080,
                    step = 1,
                    marks = Dict(i => "$i" for i = 0:90:1080),
                    value = 90,
            ),
        style = (width = "70%", display = "inline-block")),
        html_label("Total Degrees: "),
        html_div(
            dcc_slider(
                    id = "total_degrees",
                    min = 0,
                    max = 1080,
                    step = 1,
                    marks = Dict(i => "$i" for i = 0:90:1080),
                    value = 570,
            ),
        style = (width = "70%", display = "inline-block")),
        html_label("Noise: "),
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
        id = "plot_two_spirals",
        figure = gen_two_spirals(1000,0.25,90,570)
    )
end
callback!(app, Output("plot_two_spirals", "figure"),[Input("n_samples", "value"), 
                                                Input("noise", "value"),
                                                Input("start_degrees", "value"),
                                                Input("total_degrees", "value")]) do n_samples, noise, start_degrees, total_degrees
    gen_two_spirals(n_samples,noise, start_degrees, total_degrees)
end
