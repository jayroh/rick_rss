require "active_record_migrations"
require "rick_rss/configuration"
require "pry"

ActiveRecordMigrations.configure do |config|
  config.environment = ENV.fetch("db", "production")
  adapter            = RickRss::Configuration.adapter
  database           = RickRss::Configuration.database

  config.database_configuration = {
    "test" => {
      "adapter" => adapter,
      "database" => database,
    },
    "production" => {
      "adapter" => adapter,
      "database" => database,
    },
  }

  # Other settings:
  #
  # config.schema_format = :sql # default is :ruby
  # config.yaml_config = "db/config.yml"
  # config.db_dir = "db"
  # config.migrations_paths = ["db/migrate"] # 1st entry is used by generator
end

ActiveRecordMigrations.load_tasks
