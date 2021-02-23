defmodule AdventOfCode do
  alias AdventOfCode.Input, as: Input

  @moduledoc """
  Documentation for `Adventofcode`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Adventofcode.hello()
      :world

  """
  def input(file) do
    Input.load_file(file)
  end

  def check_combos do
    input(1) |> combinatorial
  end

  def check_pass_policy do
    input(2) |> passwords_policy
  end

  def check_number_of_trees do
    input(3) |> tree_encounters
  end

  def check_null(values \\ []) do
    if is_nil(values), do: raise("You've to add input file ")
  end

  def to_int(val) do
    String.to_integer(val)
  end

  def combinatorial(values \\ []) do
    check_null(values)

    for n <- values, m <- values, o <- values do
      if to_int(n) + to_int(m) + to_int(o) == 2020 do
        value = to_int(n) * to_int(m) * to_int(o)
        IO.puts("Multiplied value = #{value}..from: #{m}, #{n}, #{o} ")
      end
    end
  end

  def passwords_policy(values \\ []) do
    check_null(values)

    Enum.count(
      values,
      fn line ->
        [range, letter, pass] = String.split(line, " ", trim: true)
        [l_range, r_range] = String.split(range, "-", trim: true)
        [needle] = String.split(letter, ":", trim: true)
        chars = String.split(pass, "", trim: true)

        a = Enum.fetch!(chars, to_int(l_range) - 1)
        b = Enum.fetch!(chars, to_int(r_range) - 1)

        (a == needle || b == needle) && a != b
      end
    )
  end

  def tree_encounters(values \\ []) do
    values |> check_null

    Counter.start_link(0)

    trees =
      Enum.count(
        values,
        fn line ->
          elongated_line = String.duplicate(line, round(length(values) / 3))

          chars = String.split(elongated_line, "", trim: true)
          Counter.increment()
          count = Counter.value()
          tree_or_not = if count > 1, do: Enum.at(chars, (count - 1) * 3), else: ""
          tree_or_not == "#"
        end
      )

    Counter.reset()

    trees
  end
end
