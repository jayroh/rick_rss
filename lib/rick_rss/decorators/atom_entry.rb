# frozen_string_literal: true

module RickRss
  module Decorators
    class AtomEntry
      attr_reader :entry

      def initialize(entry)
        @entry = entry
      end

      def url
        entry.url
      end

      def title
        entry.title
      end

      def entry_id
        entry.entry_id
      end

      def author
        entry.author
      end

      def content
        entry.content
      end

      def published_at
        entry.published
      end

      def updated_at
        entry.updated
      end
    end
  end
end
