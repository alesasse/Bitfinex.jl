module Bitfinex

using Requests

# First quick implementation of public endpoints.

const SymStr = Union{Symbol, String}
const URL = "https://api.bitfinex.com/v2/"

function get_platform_status()
    return readstring(get("$URL/platform/status"))
end

function get_tickers(symbol::SymStr)
    if contains(symbol, " ")
        symbol = replace(symbol, " ", "")
    end
    return readstring(get("$URL/tickers?symbols=$symbol"))
end

function get_ticker(symbol::SymStr)
    return readstring(get("$URL/ticker/$symbol"))
end

function get_trades(symbol::SymStr)
    return readstring(get("$URL/trades/$symbol/hist"))
end

function get_books(symbol::SymStr,
                   precision::SymStr)
    return readstring(get("$URL/book/$symbol/$precision"))
end

function get_stats(key::SymStr,
                   size::SymStr,
                   symbol::SymStr,
                   side::SymStr,
                   section::SymStr)
    return readstring(get("$URL/stats1/:$key:$size:$symbol:$side/$section"))
end

function get_candles(timeframe::SymStr,
                     symbol::SymStr,
                     section::SymStr)
    return readstring(get("$URL/candles/trade:$timeframe:$symbol/$section"))
end

end
