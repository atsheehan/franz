defmodule Franz.Repo do
  @moduledoc """
  In memory repository.
  """

  def all(Franz.Message) do
    [%Franz.Message{id: "1", body: "hello, world!"},
     %Franz.Message{id: "2", body: "these pretzels are making me thirsty"},
     %Franz.Message{id: "3", body: "i've made a huge mistake"}]
  end

  def all(_module), do: []

  def get(module, id) do
    Enum.find(all(module), fn map -> map.id == id end)
  end

  def get_by(module, params) do
    Enum.find(all(module), fn map ->
      Enum.all?(params, fn {key, val} -> Map.get(map, key) == val end)
    end)
  end
end
