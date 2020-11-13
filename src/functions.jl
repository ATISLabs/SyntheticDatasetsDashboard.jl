function dropload(value)
    if value == "make_gaussian_quantiles"
        return gaussian
    elseif value == "make_blobs"
        return blobs
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

function gen_gaussian(n_samples, cov)
    blobs = SyntheticDatasets.make_gaussian_quantiles(  n_samples = n_samples,
                                                        cov = cov,
                                                        random_state = nothing);
    p = @df blobs scatter(:feature_1, :feature_2, group = :label)
    (data = Plots.plotly_series(p), layout = Plots.plotly_layout(p))
end