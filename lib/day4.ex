defmodule AdventOfCode.Day4 do
  def part1(input) do
    grid = read_grid(input)
    count_xmas(grid)
  end

  def part2(input) do
    grid = read_grid(input)
    count_xmas_patterns(grid)
  end

  defp read_grid(input) do
    String.split(input, ~r/\r?\n/, trim: true)
    |> Enum.map(&String.graphemes/1)
  end

  defp count_xmas(grid) do
    word = ["X", "M", "A", "S"]
    rows = length(grid)
    cols = grid |> List.first() |> length()

    directions = [
      # right
      {0, 1},
      # Down
      {1, 0},
      # diagonal down-right
      {1, 1},
      # diagonal up-right
      {-1, 1},
      # left
      {0, -1},
      # up
      {-1, 0},
      # diagonal up-left
      {-1, -1},
      # diagonal down-left
      {1, -1}
    ]

    Enum.reduce(0..(rows - 1), 0, fn row, acc ->
      Enum.reduce(0..(cols - 1), acc, fn col, acc_inner ->
        acc_inner + count_from_position(grid, row, col, word, directions, rows, cols)
      end)
    end)
  end

  defp count_from_position(grid, row, col, word, directions, max_row, max_col) do
    Enum.reduce(directions, 0, fn {dx, dy}, acc ->
      if match_word?(grid, row, col, dx, dy, word, max_row, max_col) do
        acc + 1
      else
        acc
      end
    end)
  end

  defp match_word?(grid, row, col, dx, dy, word, max_row, max_col) do
    Enum.with_index(word)
    |> Enum.all?(fn {char, index} ->
      new_row = row + index * dx
      new_col = col + index * dy

      if new_row >= 0 and new_row < max_row and new_col >= 0 and new_col < max_col do
        grid
        |> Enum.at(new_row)
        |> Enum.at(new_col) == char
      else
        false
      end
    end)
  end

  defp count_xmas_patterns(grid) do
    rows = length(grid)
    cols = grid |> List.first() |> length()

    mas_words = [["M", "A", "S"], ["S", "A", "M"]]

    for i <- 0..(rows - 3),
        j <- 0..(cols - 3),
        reduce: 0 do
      acc ->
        diag1 = [
          get_char(grid, i, j),
          get_char(grid, i + 1, j + 1),
          get_char(grid, i + 2, j + 2)
        ]

        diag2 = [
          get_char(grid, i, j + 2),
          get_char(grid, i + 1, j + 1),
          get_char(grid, i + 2, j)
        ]

        if diag1 in mas_words and diag2 in mas_words do
          acc + 1
        else
          acc
        end
    end
  end

  defp get_char(grid, row, col) do
    grid
    |> Enum.at(row)
    |> Enum.at(col)
  end
end
