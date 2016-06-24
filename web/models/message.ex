defmodule Franz.Message do
  use Franz.Web, :model

  schema "messages" do
    field :body, :string

    timestamps
  end

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, ["body"], [])
    |> validate_length(:body, min: 1, max: 2_000)
  end
end
