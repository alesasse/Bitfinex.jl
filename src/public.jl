"""
The ticker is a high level overview of the state of the market.
It shows you the current best bid and ask, as well as the last
trade price. It also includes information such as daily volume
and how much the price has moved over the last day.
"""
function getticker(symbol::String)
    r = get("$URL/pubticker/$symbol")
    s = String(r.body)
    return read(s)
end

"""
Various statistics about the requested pair.
"""
function getstats(symbol::String)
    r = get("$URL/stats/$symbol")
    s = String(r.body)
    return read(s)
end

"""
Full margin funding book.
"""
function getfundingbook(currency::String,
                        limit_bids::Int64 = 50,
                        limit_asks::Int64 = 50)
    r = get("$URL/lendbook/$currency?limit_bids=$limit_bids&limit_asks=$limit_asks")
    s = String(r.body)
    return read(s)
end

"""
Full order book.
"""
function getorderbook(symbol::String,
                      limit_bids::Int64 = 50,
                      limit_asks::Int64 = 50,
                      group::Bool = true)
    r = get("$URL/book/$symbol?limit_bids=$limit_bids&limit_asks=$limit_asks")
    s = String(r.body)
    return read(s)
end

"""
List of the most recent trades for the given symbol.
"""
function gettrades(symbol::String,
                   limit_trades::Int64 = 50)
    r = get("$URL/trades/$symbol?limit_trades=$limit_trades")
    s = String(r.body)
    return read(s)
end

function gettrades(symbol::String,
                   timestamp::String,
                   limit_trades::Int64 = 50)
    r = get("$URL/trades/$symbol?limit_trades=$limit_trades&timestamp=$timestamp")
    s = String(r.body)
    return read(s)
end

function gettrades(symbol::String,
                   timestamp::DateTime,
                   limit_trades::Int64 = 50)
    str_timestamp = string(value(timestamp))
    r = get("$URL/trades/$symbol?limit_trades=$limit_trades&timestamp=$str_timestamp")
    s = String(r.body)
    return read(s)
end

"""
List of the most recent funding data for the given currency: total
amount provided and Flash Return Rate (in % by 365 days) over time.
"""
function getlends(currency::String,
                 limit_lends::Int64 = 50)
    r = get("$URL/lends/$currency?limit_lends=$limit_lends")
    s = String(r.body)
    return read(s)
end

"""
List of symbol names.
"""
function symbols()
    r = get("$URL/symbols")
    s = String(r.body)
    return read(s)
end

"""
List of valid symbol IDs and the pair details.
"""
function symbol_details()
    r = get("$URL/symbols_details")
    s = String(r.body)
    return read(s)
end
