defmodule PrefectureJpTest do
  use ExUnit.Case
  doctest PrefectureJp

  test "return 47 elements" do
      assert Enum.count(PrefectureJp.all) == 47
  end
end
