defmodule Franz.Repo do
  use Ecto.Repo, otp_app: :franz

  def append_to_log(%Ecto.Changeset{valid?: true} = changeset) do
    {do_append_to_log(changeset), changeset}
  end

  def append_to_log(%Ecto.Changeset{valid?: false} = changeset) do
    {:error, changeset}
  end

  defp do_append_to_log(%Ecto.Changeset{changes: changes, model: model}) do
    KafkaEx.produce(topic_name(model.__struct__), 0, Poison.encode!(changes))
  end

  defp topic_name(model_name) do
    case model_name do
      Franz.Message -> "franz_messages"
    end
  end
end
