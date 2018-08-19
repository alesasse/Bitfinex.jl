"""
TODO: parsing of JSON into DataFrame.
"""

"""
The ticker is a high level overview of the state of the market.
It shows you the current best bid and ask, as well as the last
trade price. It also includes information such as daily volume
and how much the price has moved over the last day.
"""
function ticker(symbol::String)
    r = HTTP.get("$URL/pubticker/$symbol")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
Various statistics about the requested pair.
"""
function stats(symbol::String)
    r = HTTP.get("$URL/stats/$symbol")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
Full margin funding book.
"""
function fundingbook(currency::String,
                     limit_bids::Int64 = 50,
                     limit_asks::Int64 = 50)
    r = HTTP.get("$URL/lendbook/$currency")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
Full order book.
"""
function orderbook(symbol::String,
                   limit_bids::Int64 = 50,
                   limit_asks::Int64 = 50,
                   group::Bool = true)
    r = HTTP.get("$URL/book/$symbol")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
List of the most recent trades for the given symbol.
"""
function trades(symbol::String,
               limit_trades = 50)
    r = HTTP.get("$URL/trades/$symbol")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
List of the most recent funding data for the given currency: total
amount provided and Flash Return Rate (in % by 365 days) over time.
"""
function lends(currency::String,
               limit_trades = 50)
    r = HTTP.get("$URL/lends/$currency")
    s = String(r.body)
    return JSON.Parser.parse(s)
end

"""
List of symbol names.
"""
function symbols()
    r = HTTP.get("$URL/symbols")
    s = String(r.body)
    return DataFrame(Symbol = JSON.Parser.parse(s))
end

"""
List of valid symbol IDs and the pair details.
"""
function symboldetails()
    r = HTTP.get("$URL/symbols_details")
    s = String(r.body)
    return DataFrame(Symbol = JSON.Parser.parse(s))
end
