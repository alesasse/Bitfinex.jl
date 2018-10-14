# Bitfinex.jl

Julia wrapper for the Bitfinex REST API.

## Installation

```julia
(v1.0) pkg> add https://github.com/brilhana/Bitfinex.jl
```

## Usage
```julia
julia> using Bitfinex

julia> names(Bitfinex)
9-element Array{Symbol,1}:
 :Bitfinex        
 :getfundingbook  
 :getlends        
 :getorderbook    
 :getstats        
 :getsymboldetails
 :getsymbols      
 :getticker       
 :gettrades 

julia> getticker("btcusd")
(mid = "6360.05", bid = "6360.0", ask = "6360.1", last_price = "6360.1", low = "6299.0", high = "6399.3", volume = "8052.54028462", timestamp = "1539525945.2944384")
```

## Documentation

https://docs.bitfinex.com/v1/docs