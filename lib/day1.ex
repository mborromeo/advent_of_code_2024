defmodule AdventOfCode.Day1 do
  def part1(input) do
    {left_numbers, right_numbers} = read_numbers(input)

    sorted_left = Enum.sort(left_numbers)
    sorted_right = Enum.sort(right_numbers)

    calculate_total_distance(sorted_left, sorted_right)
  end

  def part2(input) do
    {left_numbers, right_numbers} = read_numbers(input)

    right_frequencies = build_frequency_map(right_numbers)

    calculate_similarity_score(left_numbers, right_frequencies)
  end

  defp read_numbers(input) do
    String.split(input, ~r/\r?\n/, trim: true)
    |> Enum.map(fn line ->
      [left_str, right_str | _] = String.split(line)
      {String.to_integer(left_str), String.to_integer(right_str)}
    end)
    |> Enum.unzip()
  end

  defp calculate_total_distance(left_list, right_list) do
    Enum.zip(left_list, right_list)
    |> Enum.map(fn {a, b} -> abs(a - b) end)
    |> Enum.sum()
  end

  defp build_frequency_map(numbers) do
    Enum.reduce(numbers, %{}, fn num, acc ->
      Map.update(acc, num, 1, &(&1 + 1))
    end)
  end

  defp calculate_similarity_score(left_numbers, right_frequencies) do
    Enum.reduce(left_numbers, 0, fn num, acc ->
      count_in_right = Map.get(right_frequencies, num, 0)
      acc + num * count_in_right
    end)
  end
end
