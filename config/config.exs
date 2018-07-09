# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :phoenix_elm_websocket_boilerplate,
  ecto_repos: [PhoenixElmWebsocketBoilerplate.Repo]

# Configures the endpoint
config :phoenix_elm_websocket_boilerplate, PhoenixElmWebsocketBoilerplateWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "TX1v4N72xDSUDxU68nalQMgMHtE8NqGKrKlNSB5MJ2IYo7JkF8Ea7LOXRfURYJNv",
  render_errors: [view: PhoenixElmWebsocketBoilerplateWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: PhoenixElmWebsocketBoilerplate.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
