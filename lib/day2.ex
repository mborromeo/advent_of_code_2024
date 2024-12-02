defmodule AdventOfCode.Day2 do
  def part1(input) do
    reports = read_reports(input)
    Enum.count(reports, &safe_report?/1)
  end

  def part2(input) do
    reports = read_reports(input)
    Enum.count(reports, &almost_safe_report?/1)
  end

  defp read_reports(input) do
    String.split(input, ~r/\r?\n/, trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  defp safe_report?(levels) do
    if increasing?(levels) or decreasing?(levels) do
      Enum.chunk_every(levels, 2, 1, :discard)
      |> Enum.all?(fn [a, b] ->
        diff = abs(a - b)
        diff >= 1 and diff <= 3
      end)
    else
      false
    end
  end

  defp almost_safe_report?(levels) do
    if safe_report?(levels) do
      true
    else
      Enum.any?(0..(length(levels) - 1), fn idx ->
        levels_without_i = List.delete_at(levels, idx)
        length(levels_without_i) >= 2 and safe_report?(levels_without_i)
      end)
    end
  end

  defp increasing?(levels) do
    Enum.chunk_every(levels, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> b > a end)
  end

  defp decreasing?(levels) do
    Enum.chunk_every(levels, 2, 1, :discard)
    |> Enum.all?(fn [a, b] -> b < a end)
  end
end
