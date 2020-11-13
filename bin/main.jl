using Pkg
Pkg.activate(".")

using Dash
using SyntheticDatasetsDashboard

run_server(SyntheticDatasetsDashboard.app, "0.0.0.0", 4000, debug = true)