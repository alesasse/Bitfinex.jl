function platformstatus()
    return readstring(get("$URL/platform/status"))
end

function tickers(symbol::String)
    cond, symb = check(symbol)
    if cond
        return readstring(get("$URL/tickers?symbols=$symb"))
    else
        throw(Error())
    end
end

function ticker(symbol::String)
    return readstring(get("$URL/ticker/$symbol"))
end

function trades(symbol::String)
    return readstring(get("$URL/trades/$symbol/hist"))
end

function books(symbol::String,
               precision::String)
    return readstring(get("$URL/book/$symbol/$precision"))
end

function stats(key::String,
               size::String,
               symbol::String,
               side::String,
               section::String)
    return readstring(get("$URL/stats1/:$key:$size:$symbol:$side/$section"))
end

function candles(timeframe::String,
                 symbol::String,
                 section::String)
    return readstring(get("$URL/candles/trade:$timeframe:$symbol/$section"))
end