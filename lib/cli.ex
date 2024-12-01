defmodule AdventOfCode.CLI do
  def main(args) do
    case args do
      [day_str] ->
        day = String.to_integer(day_str)
        AdventOfCode.run(day)

      _ ->
        IO.puts("Usage: advent_of_code <day_number>")
    end
  end
end
