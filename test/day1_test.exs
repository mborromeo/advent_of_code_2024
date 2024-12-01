defmodule AdventOfCode.Day1Test do
  use ExUnit.Case
  alias AdventOfCode.Day1

  test "Part 1 example input" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    expected_output = 11

    assert Day1.part1(input) == expected_output
  end

  test "Part 2 example input" do
    input = """
    3   4
    4   3
    2   5
    1   3
    3   9
    3   3
    """

    expected_output = 31

    assert Day1.part2(input) == expected_output
  end
end
