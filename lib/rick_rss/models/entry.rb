# frozen_string_literal: true
require "feedjira"

module RickRss
  class Entry < ActiveRecord::Base
    belongs_to :feed

    validates :title, presence: true
    validates :url, presence: true

    def self.upsert!(entry)
      find_or_initialize_by(
        url: entry["url"]
      ).update!(
        title: entry["title"]
      )
    end
  end
end
