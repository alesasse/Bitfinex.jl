module Bitfinex

    using DataFrames, JSON, Requests, HTTP

    export platformstatus,
           tickers,
           ticker,
           trades,
           books,
           stats,
           candles,
           symbols

    include("public.jl")
    include("calculation.jl")
    include("authenticated.jl")
    include("utils.jl")

    const URL = "https://api.bitfinex.com/v1/"

end