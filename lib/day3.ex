defmodule AdventOfCode.Day3 do
  def part1(input) do
    products = find_products(input)
    Enum.sum(products)
  end

  def part2(input) do
    events = get_events(input)
    process_events(events)
  end

  defp find_products(input) do
    pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    Regex.scan(pattern, input)
    |> Enum.map(fn [_, x_str, y_str] ->
      x = String.to_integer(x_str)
      y = String.to_integer(y_str)
      x * y
    end)
  end

  defp get_events(input) do
    do_pattern = ~r/do\(\)/
    dont_pattern = ~r/don't\(\)/
    mul_pattern = ~r/mul\((\d{1,3}),(\d{1,3})\)/

    do_events =
      Regex.scan(do_pattern, input, return: :index)
      |> Enum.map(fn [{start, _len}] -> %{type: :do, position: start} end)

    dont_events =
      Regex.scan(dont_pattern, input, return: :index)
      |> Enum.map(fn [{start, _len}] -> %{type: :dont, position: start} end)

    mul_events_with_pos = Regex.scan(mul_pattern, input, return: :index)
    mul_events_with_captures = Regex.scan(mul_pattern, input)

    mul_events =
      Enum.zip(mul_events_with_pos, mul_events_with_captures)
      |> Enum.map(fn
        {[{start, _len}, _, _], [_full_match, x_str, y_str]} ->
          x = String.to_integer(x_str)
          y = String.to_integer(y_str)
          %{type: :mul, position: start, x: x, y: y}
      end)

    events = do_events ++ dont_events ++ mul_events
    Enum.sort_by(events, & &1.position)
  end

  defp process_events(events) do
    initial_state = {true, 0}

    {_, total_sum} =
      Enum.reduce(events, initial_state, fn event, {enabled, sum} ->
        case event.type do
          :do ->
            {true, sum}

          :dont ->
            {false, sum}

          :mul ->
            if enabled do
              {enabled, sum + event.x * event.y}
            else
              {enabled, sum}
            end
        end
      end)

    total_sum
  end
end
