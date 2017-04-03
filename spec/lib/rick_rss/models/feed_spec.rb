# frozen_string_literal: true
require "spec_helper"

RSpec.describe RickRss::Feed, ".load" do
  let(:feed_path) { "spec/fixtures/rick_rss.yml" }

  before do
    allow(RickRss::Configuration).to receive(:config_file).and_return(feed_path)
  end

  it "loads the feeds list in the yaml config file into the db" do
    RickRss::Feed.load

    expect(RickRss::Feed.all.count).to eq 2
  end

  it "loads the feeds list in the yaml config file into the db" do
    RickRss::Feed.load

    expect(RickRss::Feed.all.count).to eq 2
  end

  it "loads the feeds list in the yaml config file into the db" do
    RickRss::Feed.load

    expect(RickRss::Feed.all.count).to eq 2
  end
end
