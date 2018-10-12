module Bitfinex

    using DataFrames
    
    import HTTP: get
    import JSON: parse
    import JSON2: read

    export ticker,
           stats,
           funding_book,
           order_book,
           trades,
           lends,
           symbols,
           symbol_details

    include("public.jl")
    include("utils.jl")

    const URL = "https://api.bitfinex.com/v1/"

end
