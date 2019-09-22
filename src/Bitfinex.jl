module Bitfinex

    using DataFrames

    import HTTP: get
    import JSON: parse
    import JSON2: read
    import Dates: DateTime, value

    export getticker,
           getstats,
           getfundingbook,
           getorderbook,
           gettrades,
           getlends,
           getsymbols,
           getsymboldetails

    include("public.jl")
    include("utils.jl")

    const URL = "https://api.bitfinex.com/v1"

end
