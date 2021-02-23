defmodule Counter do
  use Agent

  def start_link(initial_value \\ 0) do
    Agent.start_link(fn -> initial_value end, name: __MODULE__)
  end

  def value do
    Agent.get(__MODULE__, & &1)
  end

  def increment do
    Agent.update(__MODULE__, &(&1 + 1))
  end

  def reset do
    Agent.update(__MODULE__, &(&1 * 0))
  end
end
