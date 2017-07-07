# frozen_string_literal: true
module RickRss
  class Poll
    def self.start
      new.start
    end

    def start
      RickRss::Feed.load
    end
  end
end
