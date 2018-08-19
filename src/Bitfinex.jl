module Bitfinex

    using DataFrames, JSON, HTTP

    export ticker,
           trades,
           fundingbook,
           orderbook,
           trades,
           lends,
           symbols,
           symboldetails

    include("authenticated.jl")
    include("calculation.jl")
    include("public.jl")

    const URL = "https://api.bitfinex.com/v1/"
    const KEY = "<Your API key here>"
    const SECRET = "<Your API secret here>"

end