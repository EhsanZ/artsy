defmodule ArtsyWeb.ArtistsController do
  use ArtsyWeb, :controller

  def index(conn, _params) do
    Artsy.API.start
    response = Artsy.API.post("/", all_artists_query())

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        render(conn, "index.html", artists: body["data"]["popular_artists"]["artists"])
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def show(conn, %{"id" => id}) do
    Artsy.API.start

    response = Artsy.API.post("/", artist_by_id_query(id))

    case response do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        render(conn, "show.html", artworks: body["data"]["artist"]["artworks"])
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  defp all_artists_query do
    "{\"query\": \"{ popular_artists { artists { id name imageUrl bio birthday } } }\" }"
  end

  defp artist_by_id_query(id) do
    query = ~s"""
      {
          artist(id: \\"#{id}\\") {
            id
            name
            artworks {
              id
              imageUrl
              displayLabel
              dimensions {
                in
                cm
              }
            }
          }
      }
    """
    |> String.replace("\n", " ")

    ~s({ "query": "#{query}" })
  end
end



