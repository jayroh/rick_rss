# frozen_string_literal: true
require "spec_helper"

module RickRss
  RSpec.describe Install, ".run" do
    let(:base_dir) { "/tmp/rick_rss" }
    let(:db_location) { "#{base_dir}/rick_rss.sqlite3" }
    let(:config_location) { "#{base_dir}/rick_rss_config" }

    before(:each) do
      allow(RickRss::Configuration).
        to receive(:base_dir).and_return(base_dir)

      allow(RickRss::Configuration).
        to receive(:database).and_return(db_location)

      allow(RickRss::Configuration).
        to receive(:config_file).and_return(config_location)
    end

    after(:each) do
      Dir.exist?(base_dir) && FileUtils.rm_rf(base_dir)
    end

    it "creates the base directory, db, and config" do
      expect(Dir.exist? base_dir).to eq false

      RickRss::Install.run

      expect(Dir.exist? base_dir).to eq true
      expect(File.exist? db_location).to eq true
      expect(File.exist? config_location).to eq true
    end
  end
end
