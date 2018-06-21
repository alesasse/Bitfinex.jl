using DataFrames, JSON, Requests

function symbols()
    str = readstring(get("https://api.bitfinex.com/v1/symbols"))
    return DataFrame(Symbol = JSON.Parser.parse(str))
end

symbs = symbols()

function check(symbol::String)
    if contains(symbol, " ")
        symbol = replace(symbol, " ", "")
        return true, symbol
    elseif symbol in symbs
        return false, symbol
    end
    return true, symbol
end