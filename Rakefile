# frozen_string_literal: true

require "active_record_migrations"
require "pry"
require "rick_rss/configuration"
require "rspec/core/rake_task"

ActiveRecordMigrations.configure do |config|
  config.environment = ENV.fetch("db", ENV.fetch("DB", "test"))
  config.yaml_config = "db/config.yml"
end

ActiveRecordMigrations.load_tasks

task(:default).clear
task(:spec).clear

RSpec::Core::RakeTask.new(:spec) do |t|
  t.verbose = false
end

task default: :spec
