defmodule Franz.Message do
  use Franz.Web, :model

  schema "messages" do
    field :body, :string

    timestamps
  end
end
