using Documenter
using OhMyThreads
using StableTasks

const ci = get(ENV, "CI", "") == "true"

@info "Generating Documenter.jl site"
makedocs(;
    sitename = "OhMyThreads.jl",
    authors = "Carsten Bauer, Mason Protter",
    modules = [OhMyThreads, StableTasks],
    checkdocs = :exports,
    # doctest = ci,
    pages = [
        "OhMyThreads" => "index.md",
        #  "Examples" => [
        #      "A" => "examples/A.md",
        #  ],
        #  "Explanations" => [
        #      "B" => "explanations/B.md",
        #  ],
        "References" => [
            "Public API" => "refs/api.md",
            "Internal" => "refs/internal.md",
        ],
    ],
    repo = "https://github.com/JuliaFolds2/OhMyThreads.jl/blob/{commit}{path}#{line}",
    format = Documenter.HTML(repolink = "https://github.com/JuliaFolds2/OhMyThreads.jl";
        collapselevel = 1))

if ci
    @info "Deploying documentation to GitHub"
    deploydocs(;
        repo = "github.com/JuliaFolds2/OhMyThreads.jl.git",
        devbranch = "master",
        push_preview = true,)
end
