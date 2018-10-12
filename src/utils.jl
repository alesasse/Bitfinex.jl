function json2df(s::String)
    s_json = parse(s)
    ks = Symbol.(collect(keys(s_json[1])))
    df = DataFrame(map(k -> k => [], ks)...)
    foreach(x -> push!(df, x), s_json)
    return df
end
