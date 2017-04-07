# frozen_string_literal: true
require "feedjira"

module RickRss
  class Entry < ActiveRecord::Base
    belongs_to :feed

    validates :title, presence: true
    validates :url, presence: true

    def self.upsert!(parsed_entry)
      entry = decorate(parsed_entry)
      rick_rss_entry = find_or_initialize_by(entry_id: entry.entry_id)
      rick_rss_entry.update!(
        url: entry.url,
        title: entry.title,
        author: entry.author,
        content: entry.content,
        entry_published_at: entry.published_at,
        entry_updated_at: entry.updated_at,
      )

      rick_rss_entry
    end

    def self.decorate(entry)
      parser_class = entry.class.to_s.split("::").last
      decorator_class = "RickRss::Decorators::#{parser_class}".constantize
      decorator_class.new(entry)
    end
  end
end
