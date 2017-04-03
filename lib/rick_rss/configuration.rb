# frozen_string_literal: true

module RickRss
  class Configuration
    CONFIG_SOURCE = ".rick_rss_sample"
    HOME_DIR = File.expand_path("~")

    def self.adapter
      "sqlite3"
    end

    def self.base_dir
      "#{HOME_DIR}/.rick_rss"
    end

    def self.config_file
      "#{base_dir}/config"
    end

    def self.database
      "#{base_dir}/rick_rss.sqlite3"
    end
  end
end
