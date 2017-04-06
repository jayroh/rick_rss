# frozen_string_literal: true
require "feedjira"

module RickRss
  # Model corresponding to the `feeds` database table
  class Feed < ActiveRecord::Base
    def self.load
      path            = RickRss::Configuration.config_file
      config_contents = File.read(path)
      config          = YAML.load(config_contents)

      config["feeds"].each do |user_feed|
        feed = Feedjira::Feed.fetch_and_parse(user_feed)

        create(
          title: feed.title,
          url: feed.feed_url,
          last_modified: feed.last_modified
        )
      end
    end
  end
end
