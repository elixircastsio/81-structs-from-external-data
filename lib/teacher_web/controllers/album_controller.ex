defmodule TeacherWeb.AlbumController do
  use TeacherWeb, :controller

  alias Teacher.Recordings

  def index(conn, _params) do
    albums = Recordings.fetch_albums()
    render(conn, "index.html", albums: albums)
  end

  def show(conn, %{"id" => id}) do
    album = Recordings.fetch_album(id)
    render(conn, "show.html", album: album)
  end
end
