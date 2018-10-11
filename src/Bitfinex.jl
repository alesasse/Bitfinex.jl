module Bitfinex

    using DataFrames, HTTP, JSON

    export tickers,
           stats,
           funding_book,
           order_book,
           trades,
           lends,
           symbols,
           symbols_details

    include("public.jl")
    include("utils.jl")

    const URL = "https://api.bitfinex.com/v1/"

end
