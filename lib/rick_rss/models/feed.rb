# frozen_string_literal: true
require "feedjira"

module RickRss
  # Model corresponding to the `feeds` database table
  class Feed < ActiveRecord::Base
    has_many :entries

    validates :title, presence: true
    validates :url, presence: true

    def self.load
      path            = RickRss::Configuration.config_file
      config_contents = File.read(path)
      config          = YAML.load(config_contents)

      config["feeds"].each do |user_feed|
        parsed_feed = Feedjira::Feed.fetch_and_parse(user_feed)

        feed = find_or_initialize_by(
          title: parsed_feed.title,
          url: parsed_feed.feed_url,
        )
        feed.update!(last_modified: parsed_feed.last_modified)
        feed.update_items_with(parsed_feed.entries)
      end
    end

    def update_items_with(parsed_entries)
      parsed_entries.each do |entry|
        self.entries.upsert!(entry)
      end
    end
  end
end
