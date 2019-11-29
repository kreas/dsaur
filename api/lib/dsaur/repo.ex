defmodule Dsaur.Repo do
  use Ecto.Repo,
    otp_app: :dsaur,
    adapter: Ecto.Adapters.Postgres
end
