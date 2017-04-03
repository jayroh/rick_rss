require "active_record_migrations"
require "rick_rss/configuration"
require "pry"

ActiveRecordMigrations.configure do |config|
  config.environment = ENV.fetch("db", "production")
  config.yaml_config = "db/config.yml"

  # Other settings:
  #
  # config.database_configuration = {
  #   "test" => {
  #     "adapter" => "sqlite3",
  #     "database" => "db/rick_rss_test.sqlite3",
  #   },
  #   "production" => {
  #     "adapter" => "sqlite3",
  #     "database" => "~/.rick_rss/rick_rss.sqlite3",
  #   },
  # }
  # config.schema_format = :sql # default is :ruby
  # config.yaml_config = "db/config.yml"
  # config.db_dir = "db"
  # config.migrations_paths = ["db/migrate"] # 1st entry is used by generator
end

ActiveRecordMigrations.load_tasks
