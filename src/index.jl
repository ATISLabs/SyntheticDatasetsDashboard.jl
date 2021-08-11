dropdown_options = [
    Dict("label" => "Blobs", "value" => "make_blobs"),
    Dict("label" => "Gaussian Quantiles", "value" => "make_gaussian_quantiles"),
    Dict("label" => "Moons", "value" => "make_moons"),
    Dict("label" => "Two Spirals", "value" => "make_twospirals"),
    Dict("label" => "Circles", "value" => "make_circles"),
]

app.layout = html_div(id="page-index") do
    html_div(id="container") do
        html_div(id="header") do
            html_a(href="http://www.ufrrj.br/", target="_blank") do 
                html_img(id="logo", src="/assets/logo.png", alt="logo")
            end,
            html_a(href="https://atislabs.com.br/", target="_blank") do 
                html_h2("ATISLabs")
            end
        end,
        html_hr(),
        html_div(id="main") do
            html_h1("Synthetic Datasets Dashboard"),
            html_div(id = "link") do
                dcc_dropdown(id="drop", options = dropdown_options, value = "make_blobs")
            end,
            dcc_location(id="url", refresh = false),
            html_div(id="page-content")
        end,
        html_hr(),
        html_div(id="footer") do
            html_a(href="http://www.dcc.ufrrj.br", target="_blank") do 
                html_p("© DCC/UFRRJ 2020")
            end
        end
    end
end

callback!(app,Output("page-content", "children"),[Input("drop","value")]) do drop
    dropload(drop)
end