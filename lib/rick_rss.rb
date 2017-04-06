# frozen_string_literal: true
require "active_record"
require "rick_rss/configuration"
require "rick_rss/install"
require "rick_rss/models/feed"
require "rick_rss/models/entry"

module RickRss
  # Get it started
  class Init
    def self.call
      ActiveRecord::Base.connection

    rescue ActiveRecord::ConnectionNotEstablished => _err
      env = ENV["db"]
      db_config = YAML.load(File.open("db/config.yml"))[env]
      ActiveRecord::Base.establish_connection(db_config)
    end
  end
end
