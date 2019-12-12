defmodule Artsy.API do
  use HTTPoison.Base

  def process_request_url(url) do
    "https://metaphysics-production.artsy.net" <> url
  end

  def process_request_headers(headers) do
    [
      {"Content-Type", "application/json"},
      {"x-access-token", "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1ZGI5ZmU1YjQ4ZWVhMzAwMGUwOTk0MjkiLCJzYWx0X2hhc2giOiI1MjVmOWUwNDRjNDRlMTYzOGM5NGIxNjIzYmU3YmQzNSIsInJvbGVzIjoidXNlciIsInBhcnRuZXJfaWRzIjpbXSwiZXhwIjoxNTc3NjU0MzY0LCJpYXQiOjE1NzI0NzAzNjQsImF1ZCI6IjVkNDA5OTZlNmU2MDQ5MDAwNzQ5MGZhMiIsImlzcyI6IkdyYXZpdHkiLCJqdGkiOiI1ZGI5ZmU1YzU4ZjFkNDAwMGVhN2U0OWMifQ.D_6mq973VFN2Yvy0aXSUoh_FKTRHgpKcivFuCssPyWo"},
      {"x-user-id", "5db9fe5b48eea3000e099429"}
    ]
  end

  def process_request_body(body), do: body

  def process_response_body(body) do
    body
    |> Poison.decode!
  end

  def request(method, url, request_headers, body, hn_options) do
    IO.inspect(method)
    IO.inspect(url)
    IO.inspect(request_headers)
    IO.inspect(body)
    IO.inspect(hn_options)

    super(method, url, request_headers, body, hn_options)
end
end
