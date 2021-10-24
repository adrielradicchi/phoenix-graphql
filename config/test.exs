import Config

# Configure your database
#
# The MIX_TEST_PARTITION environment variable can be used
# to provide built-in test partitioning in CI environment.
# Run `mix help test` for more information.
config :wabanex, Wabanex.Repo,
  username: "postgres",
  password: "postgres",
  database: "wabanex_test#{System.get_env("MIX_TEST_PARTITION")}",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox,
  port: 5431,
  pool_size: 10

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :wabanex, WabanexWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "QPU7ocJiTO9/DkXjeF4yOS4bHHTnDebE4LX0YbIvoR5lwph4u/WhKrk59Mutxbj4",
  server: false

# In test we don't send emails.
config :wabanex, Wabanex.Mailer, adapter: Swoosh.Adapters.Test

# Print only warnings and errors during test
config :logger, level: :warn

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
