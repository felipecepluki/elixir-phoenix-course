defmodule Bananex.Repo do
  use Ecto.Repo,
    otp_app: :bananex,
    adapter: Ecto.Adapters.Postgres
end
