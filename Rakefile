require "active_record_migrations"
require "rick_rss/configuration"
require "pry"

ActiveRecordMigrations.configure do |config|
  config.environment = ENV.fetch("db", "production")
  config.yaml_config = "db/config.yml"
end

ActiveRecordMigrations.load_tasks
