defmodule Teacher.Recordings do
  alias Teacher.Recordings.Album

  def fetch_albums do
    response = HTTPoison.get!("http://localhost:4001/api/albums")

    response.body
    |> Jason.decode!()
    |> Enum.map(&Album.new/1)
  end

  def fetch_album(id) do
    response = HTTPoison.get!("http://localhost:4001/api/albums/#{id}")

    response.body
    |> Jason.decode!()
    |> Album.new()
  end

end
