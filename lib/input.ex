defmodule AdventOfCode.Input do
  @moduledoc """
  Documentation for `AdventOfCode.Input`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> AdventOfCode.Input.load_file()
      

  """
  def load_file(filename) do
    filename = if is_integer(filename), do: Integer.to_string(filename), else: filename

    abs_flname = Path.expand("./inputs/" <> filename <> ".txt") |> Path.absname()

    case File.read(abs_flname) do
      {:ok, binary} -> String.split(binary, "\n", trim: true)
      {:error, _} -> "file with the name not found"
    end
  end
end
