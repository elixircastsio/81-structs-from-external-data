defmodule Teacher.Recordings.Album do
  defstruct [:id, :artist_name, :album_category, :album_title, :album_year, :album_summary]
  use ExConstructor

  # def build(attrs) do
  #   formatted_attrs = %{
  #     id: attrs["id"],
  #     artist_name: attrs["artist_name"],
  #     album_category: attrs["album_category"],
  #     album_title: attrs["album_title"],
  #     album_year: attrs["album_year"],
  #     album_summary: attrs["album_summary"]
  #   }
  #
  #   struct(__MODULE__, formatted_attrs)
  # end

end
