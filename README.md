# Chango

This is an escript CLI tool made to rename all images in a timestampy format of `YYYY-M-D_HR-MM-SS.ext`.
I added a preview function by doing `--test=true`

## Setup
Get deps:
`mix deps.get`

Then generate escript:
`mix escript.build`

usage is `./chango --in=folder/path`

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `chango` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:chango, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/chango](https://hexdocs.pm/chango).
