# frozen_string_literal: true

require "rake"

module RickRss
  # Installs all necessary files and dependencies
  class Install
    def self.run
      old_env = ENV["db"]
      ENV["db"] = "production"
      new.run
    ensure
      ENV["db"] = old_env
    end

    def run
      if Dir.exist?(RickRss::Configuration.base_dir)
        message = "Config directory already exists."
      else
        FileUtils.mkdir(RickRss::Configuration.base_dir)
      end
      Rake.load_rakefile("Rakefile")
      Rake.application["db:setup"].reenable
      Rake.application["db:setup"].invoke
      FileUtils.cp(
        RickRss::Configuration::CONFIG_SOURCE,
        RickRss::Configuration.config_file,
      )
      message
    end
  end
end
