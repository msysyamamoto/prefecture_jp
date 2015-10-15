defmodule PrefectureJpTest.Place do
    use Ecto.Model
    use PrefectureJp, :prefecture_code
    
    schema "places" do
        field :prefecture_code, :string
    end

end

defmodule PrefectureJpTest do
    use ExUnit.Case, async: true

    doctest PrefectureJp

    test "return 47 elements" do
        assert Enum.count(PrefectureJp.all) == 47
    end

    test "order" do
        Enum.zip(PrefectureJp.all, List.delete_at(PrefectureJp.all, 0))
        |> Enum.all?(fn({a, b}) ->
            numa = String.to_integer(a.code, 10)
            numb = String.to_integer(b.code, 10)
            numb - numa == 1
        end)
    end

    test "ecto" do
        alias PrefectureJpTest.Place
        place = %Place{prefecture_code: "13"}
        assert (place |> Place.prefecture(:name) == "東京都")
    end
end
