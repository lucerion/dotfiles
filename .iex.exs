import_if_available Ecto.Query

IEx.configure(history_size: 4096)

defmodule :iex do
  def exit,   do: System.stop()

  def reload, do: respawn()

  def recompile do
    app = Mix.Project.config[:app]
    Mix.Task.reenable "compile.elixir"
    Application.stop(app)
    Mix.Task.run "compile.elixir"
    Application.start(app, :permanent)
  end
end
