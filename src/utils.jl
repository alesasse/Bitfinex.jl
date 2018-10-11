"""
Source: https://github.com/johnmyleswhite/DataFramesIO.jl/blob/master/src/json.jl
"""
function json2df(s::String)
    arrayofhashes = JSON.parse(s)
    nrows = length(arrayofhashes)

    if nrows == 0
        return DataFrame()
    end
    
    colnamesset = Set(collect(keys(arrayofhashes[1])))
    
    for i in 2:length(arrayofhashes)
        union!(colnamesset, keys(arrayofhashes[i]))
    end
    
    colnames = sort(collect(colnamesset))
    
    ncols = length(colnames)
    df = DataFrame(repeat([Any], inner = [ncols]), convert(Vector{Symbol}, colnames), nrows)
    
    for i in 1:nrows
        for j in 1:ncols
            df[i, j] = get(arrayofhashes[i], colnames[j], NA)
        end
    end
    return df
end
