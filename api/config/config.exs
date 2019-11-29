# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :dsaur,
  ecto_repos: [Dsaur.Repo],
  generators: [binary_id: true]

# Configures the endpoint
config :dsaur, DsaurWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "xz2dIxZwC93daS7U20zZAHBwuPZj7CoNNPPML34c5PuLXoJUXEztkIfkDsRR8lMd",
  render_errors: [view: DsaurWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Dsaur.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
