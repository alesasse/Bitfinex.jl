# Bitfinex.jl

Julia wrapper for the Bitfinex REST API.

## Installation

```julia
(v1.0) pkg> add https://github.com/brilhana/Bitfinex.jl
```

## Usage
```julia
julia> using Bitfinex

julia> stats("btcusd")
3×2 DataFrames.DataFrame
│ Row │ period │ volume          │
│     │ Any    │ Any             │
├─────┼────────┼─────────────────┤
│ 1   │ 1      │ 41195.66415107  │
│ 2   │ 7      │ 101364.04300661 │
│ 3   │ 30     │ 492908.6446922  │
```

## TODO

* Public endpoints.
* Tests.

## Documentation

https://docs.bitfinex.com/v1/docs