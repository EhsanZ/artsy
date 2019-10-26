defmodule Artsy.Repo do
  use Ecto.Repo,
    otp_app: :artsy,
    adapter: Ecto.Adapters.Postgres
end
