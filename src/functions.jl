function dropload(value)
    if value == "make_gaussian_quantiles"
        return gaussian
    elseif value == "make_blobs"
        return blobs
    elseif value == "make_moons"
        return moons
    elseif value == "make_twospirals"
        return spirals
    elseif value == "make_circles"
        return circles
    end
end

function gen_plot(n_samples, cluster_std)
    blobs = SyntheticDatasets.make_blobs(   n_samples = n_samples,
                                            n_features = 2,
                                            centers = [-1 1; -0.5 0.5],
                                            cluster_std = Float64(cluster_std),
                                            center_box = (-2.0, 2.0),
                                            shuffle = true,
                                            random_state = nothing);
    p = @df blobs scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end

function gen_gaussian(n_samples, cov,n_classes)
    gaussian = SyntheticDatasets.make_gaussian_quantiles(   n_samples = n_samples,
                                                            cov = Float64(cov),
                                                            n_classes = n_classes,
                                                            random_state = nothing);
    p = @df gaussian scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end

function gen_moons(n_samples, noise)
    moons = SyntheticDatasets.make_moons(   n_samples = n_samples,
                                            noise = Float64(noise),
                                            random_state = nothing);
    p = @df moons scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end

function gen_two_spirals(n_samples, noise, start_degrees, total_degrees)
    spirals = SyntheticDatasets.make_twospirals(   n_samples = n_samples,
                                                    noise = Float64(noise),
                                                    start_degrees = start_degrees,
                                                    total_degrees = total_degrees);
    p = @df spirals scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end

function gen_circles(n_samples, noise, factor)
    circles = SyntheticDatasets.make_circles(   n_samples = n_samples,
                                                noise = Float64(noise),
                                                factor = Float64(factor));
    p = @df circles scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end
