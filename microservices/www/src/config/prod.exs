use Mix.Config

# For production, we often load configuration from external
# sources, such as your system environment. For this reason,
# you won't find the :http configuration below, but set inside
# HelloWeb.Endpoint.init/2 when load_from_system_env is
# true. Any dynamic configuration should be done there.
#
# Don't forget to configure the url host to something meaningful,
# Phoenix uses this information when generating URLs.
#
# Finally, we also include the path to a cache manifest
# containing the digested version of static files. This
# manifest is generated by the mix phx.digest task
# which you typically run after static files are built.
config :hello, HelloWeb.Endpoint,
  load_from_system_env: true,
  url: [host: "example.com", port: 8080],
  cache_static_manifest: "priv/static/cache_manifest.json",
  secret_key_base: System.get_env("SECRET_KEY_BASE")

# Do not print debug messages in production
config :logger, level: :info

config :hello, Hello.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "admin",
  password: System.get_env("DB_PASSWORD"),
  database: "hasuradb",
  hostname: "postgres.hasura",
  pool_size: 15
