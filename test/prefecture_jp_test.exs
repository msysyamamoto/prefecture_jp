defmodule PrefectureJpTest.Place do
    use Ecto.Model
    schema "places" do
        field :prefecture_code, :string
    end

    use PrefectureJp, :prefecture_code
end

defmodule PrefectureJpTest do
    use ExUnit.Case

    doctest PrefectureJp

    test "return 47 elements" do
        assert Enum.count(PrefectureJp.all) == 47
    end

    test "find by code (string)" do
        assert PrefectureJp.find("13").name == "東京都"
    end

    test "find by code (tuple)" do
        assert PrefectureJp.find(code: "13").name == "東京都"
    end

    test "find by name" do
        assert PrefectureJp.find(name: "東京都").code == "13"
        assert PrefectureJp.find(name: "東京").code   == "13"
    end

    test "find by name_e" do
        assert PrefectureJp.find(name: "TOKYO").code == "13"
        assert PrefectureJp.find(name: "tokyo").code == "13"
    end

    test "find by name_h" do
        assert PrefectureJp.find(name: "とうきょうと").code == "13"
    end

    test "find by name_k" do
        assert PrefectureJp.find(name: "トウキョウト").code == "13"
    end

    test "finb by invalid" do
        assert PrefectureJp.find(invalid: "tokyo") == nil
        assert PrefectureJp.find(a: "a", b: "b") == nil
        assert PrefectureJp.find(12345) == nil
    end

    test "ecto" do
        alias PrefectureJpTest.Place
        place = %Place{prefecture_code: "13"}
        assert (place |> Place.prefecture(:name) == "東京都")
    end
end
