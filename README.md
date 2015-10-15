# PrefectureJp

PrefectureJp is a library for converting the Japanese prefecture code and  Japanese prefecture name.

Inspired by [jp_prefecture](https://github.com/chocoby/jp_prefecture).

## Installation

If [available in Hex](https://hex.pm/packages/prefecture_jp), the package can be installed as:

* Add prefecture_jp to your list of dependencies in `mix.exs`:

```elixir
def deps do
    [{:prefecture_jp, "~> 0.0.1"}]
end
```

## Usage

```elixir
iex> PrefectureJp.find("13").name
"東京都"

iex> PrefectureJp.find(name: "東京都").code
"13"

iex> PrefectureJp.all
[%PrefectureJp.Prefecture{area: "北海道", code: "01", name: "北海道",
  name_e: "hokkaido", name_h: "ほっかいどう",
  name_k: "ホッカイドウ"},
  .
  .
  .
 %PrefectureJp.Prefecture{area: "九州", code: "47", name: "沖縄県",
  name_e: "okinawa", ...}]
```

### with Ecto

```elixir
defmodule Place do
    use Ecto.Model
    use PrefectureJp, :prefecture_code

    schema "places" do
        field :prefecture_code, :string
    end
end
```

```elixir
iex> place = %Place{prefecture_code: "23"}
iex> place |> Place.prefecture(:name)
"愛知県"
```
