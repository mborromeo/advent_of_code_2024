defmodule AdventOfCode.Day3Test do
  use ExUnit.Case
  alias AdventOfCode.Day3

  test "Part 1 example input" do
    input = """
    xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))
    """

    expected_output = 161

    assert Day3.part1(input) == expected_output
  end

  test "Part 2 example input" do
    input = """
    xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))
    """

    expected_output = 48

    assert Day3.part2(input) == expected_output
  end
end
