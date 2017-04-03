# frozen_string_literal: true
module RickRss
  # Model corresponding to the `feeds` database table
  class Feed < ActiveRecord::Base
    def self.load
      path            = RickRss::Configuration.config_file
      config_contents = File.read(path)
      config          = YAML.load(config_contents)

      config["feeds"].each do |feed|
        puts feed

        create(
          title: "feed 1",
          url: feed,
          last_modified: DateTime.now,
        )
      end
    end
  end
end
