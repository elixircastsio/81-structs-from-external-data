defmodule TeacherWeb.AlbumControllerTest do
  use TeacherWeb.ConnCase

  alias Teacher.Recordings

  @create_attrs %{
    artist: "some artist",
    summary: "some summary",
    title: "some title",
    year: "some year"
  }
  @update_attrs %{
    artist: "some updated artist",
    summary: "some updated summary",
    title: "some updated title",
    year: "some updated year"
  }
  @invalid_attrs %{artist: nil, summary: nil, title: nil, year: nil}

  def fixture(:album) do
    {:ok, album} = Recordings.create_album(@create_attrs)
    album
  end

  describe "index" do
    test "lists all albums", %{conn: conn} do
      conn = get(conn, Routes.album_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Albums"
    end
  end

  describe "new album" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.album_path(conn, :new))
      assert html_response(conn, 200) =~ "New Album"
    end
  end

  describe "create album" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.album_path(conn, :create), album: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.album_path(conn, :show, id)

      conn = get(conn, Routes.album_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Album"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.album_path(conn, :create), album: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Album"
    end
  end

  describe "edit album" do
    setup [:create_album]

    test "renders form for editing chosen album", %{conn: conn, album: album} do
      conn = get(conn, Routes.album_path(conn, :edit, album))
      assert html_response(conn, 200) =~ "Edit Album"
    end
  end

  describe "update album" do
    setup [:create_album]

    test "redirects when data is valid", %{conn: conn, album: album} do
      conn = put(conn, Routes.album_path(conn, :update, album), album: @update_attrs)
      assert redirected_to(conn) == Routes.album_path(conn, :show, album)

      conn = get(conn, Routes.album_path(conn, :show, album))
      assert html_response(conn, 200) =~ "some updated artist"
    end

    test "renders errors when data is invalid", %{conn: conn, album: album} do
      conn = put(conn, Routes.album_path(conn, :update, album), album: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Album"
    end
  end

  describe "delete album" do
    setup [:create_album]

    test "deletes chosen album", %{conn: conn, album: album} do
      conn = delete(conn, Routes.album_path(conn, :delete, album))
      assert redirected_to(conn) == Routes.album_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.album_path(conn, :show, album))
      end
    end
  end

  defp create_album(_) do
    album = fixture(:album)
    {:ok, album: album}
  end
end
