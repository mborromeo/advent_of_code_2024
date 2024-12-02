defmodule AdventOfCode.Day2Test do
  use ExUnit.Case
  alias AdventOfCode.Day2

  test "Part 1 example input" do
    input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

    expected_output = 2

    assert Day2.part1(input) == expected_output
  end

  test "Part 2 example input" do
    input = """
    7 6 4 2 1
    1 2 7 8 9
    9 7 6 2 1
    1 3 2 4 5
    8 6 4 4 1
    1 3 6 7 9
    """

    expected_output = 4

    assert Day2.part2(input) == expected_output
  end
end
