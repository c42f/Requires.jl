module Requires

using UUIDs

include("init.jl")
include("require.jl")

function __init__()
    push!(package_callbacks, loadpkg)
end

if isprecompiling()
    @assert precompile(loadpkg, (Base.PkgId,))
    @assert precompile(withpath, (Any, String))
    @assert precompile(err, (Any, Module, String))
    @assert precompile(parsepkg, (Expr,))
    @assert precompile(listenpkg, (Any, Base.PkgId))
    @assert precompile(callbacks, (Base.PkgId,))
    @assert precompile(withnotifications, (Vararg{Any},))
    @assert precompile(withnotifications, (Any, Vararg{Any},))
end

end # module
