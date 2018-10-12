module Bitfinex

    using DataFrames, HTTP, JSON2

    export tickers,
           stats,
           funding_book,
           order_book,
           trades,
           lends,
           symbols,
           symbols_details,
           json2df

    include("public.jl")
    include("utils.jl")

    const URL = "https://api.bitfinex.com/v1/"

end
