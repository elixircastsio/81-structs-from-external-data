defmodule TeacherWeb.Plugs.FetchSecretCode do
  import Plug.Conn

  def init(_args) do
  end

  def call(conn, _args) do
    if conn.assigns[:current_user] do
      %HTTPoison.Response{body: body} = fetch_code()

      secret_code =
        body
        |> Jason.decode!()
        |> Map.get("code")

      assign(conn, :secret_code, secret_code)
    else
      conn
    end
  end

  def fetch_code() do
    HTTPoison.get!("localhost:4001/api/code")
  end
end
