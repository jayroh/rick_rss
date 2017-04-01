# frozen_string_literal: true
require "active_record"
require "rick_rss/configuration"
require "rick_rss/install"
require "rick_rss/models/feed"

module RickRss
  DB_URI = ENV.fetch("RICK_RSS_DB_URI", "sqlite3://~/.rick_rss.sqlite3")
end
