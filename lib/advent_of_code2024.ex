defmodule AdventOfCode do
  def run(day) when is_integer(day) and day >= 1 and day <= 25 do
    input = File.read!("inputs/day#{day}.txt")
    module = Module.concat(AdventOfCode, "Day#{day}")

    part1_result = apply(module, :part1, [input])
    part2_result = apply(module, :part2, [input])

    IO.puts("Day #{day} - Part 1: #{part1_result}")
    IO.puts("Day #{day} - Part 2: #{part2_result}")
  end

  def run(_), do: IO.puts("Please provide a valid day between 1 and 25.")
end
