defmodule AdventOfCode.Day4Test do
  use ExUnit.Case
  alias AdventOfCode.Day4

  test "Part 1 example input" do
    input = """
    MMMSXXMASM
    MSAMXMSMSA
    AMXSXMAAMM
    MSAMASMSMX
    XMASAMXAMM
    XXAMMXXAMA
    SMSMSASXSS
    SAXAMASAAA
    MAMMMXMMMM
    MXMXAXMASX
    """

    expected_output = 18

    assert Day4.part1(input) == expected_output
  end

  test "Part 2 example input" do
    input = """
    .M.S......
    ..A..MSMS.
    .M.S.MAA..
    ..A.ASMSM.
    .M.S.M....
    ..........
    S.S.S.S.S.
    .A.A.A.A..
    M.M.M.M.M.
    ..........
    """

    expected_output = 9

    assert Day4.part2(input) == expected_output
  end
end
