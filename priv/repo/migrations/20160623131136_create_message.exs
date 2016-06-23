defmodule Franz.Repo.Migrations.CreateMessage do
  use Ecto.Migration

  def change do
    create table(:messages) do
      add :body, :string, null: false

      timestamps
    end
  end
end
