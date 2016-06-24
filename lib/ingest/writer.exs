KafkaEx.create_worker(:writer)

for message <- KafkaEx.stream("franz_messages", 0, offset: 0) do
  params = Poison.decode!(message.value)
  changeset = Ecto.Changeset.cast(%Franz.Message{}, params, ["body"])
  Franz.Repo.insert(changeset)
end
