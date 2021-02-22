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
    |> combinatorial
  end

  def combinatorial(values \\ []) do
    for n <- values, m <- values, o <- values do
      if String.to_integer(n) + String.to_integer(m) + String.to_integer(o) == 2020 do
        value = String.to_integer(n) * String.to_integer(m) * String.to_integer(o)
        IO.puts("Multiplied value = #{value}..from: #{m}, #{n}, #{o} ")
      end
    end
  end
end
