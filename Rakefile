require "pry"
require "active_record_migrations"

ActiveRecordMigrations.configure do |config|
  config.database_configuration = {
    "development" => {
      "adapter" => "sqlite3",
      "database" => "db/rick.sqlite3",
    },
    "test" => {
      "adapter" => "sqlite3",
      "database" => "db/rick_test.sqlite3",
    },
    "production" => {
      "adapter" => "sqlite3",
      "database" => "~/.rick_rss.sqlite3",
    },
  }

  # Other settings:
  # config.schema_format = :sql # default is :ruby
  # config.yaml_config = "db/config.yml"
  # config.environment = ENV["db"]
  # config.db_dir = "db"
  # config.migrations_paths = ["db/migrate"] # the first entry will be used by the generator
end

ActiveRecordMigrations.load_tasks
