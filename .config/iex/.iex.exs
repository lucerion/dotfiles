import_if_available Ecto.Query

IEx.configure(
  history_size: 4096,
  inspect: [limit: :infinity]
)

defmodule :iex do
  def exit, do: System.stop()

  def reload, do: respawn()
end
