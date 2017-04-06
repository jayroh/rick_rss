# frozen_string_literal: true
require "spec_helper"

RSpec.describe RickRss::Entry, "validations" do
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:url) }
end

RSpec.describe RickRss::Entry, "associations" do
  it { should belong_to(:feed) }
end

RSpec.describe RickRss::Feed, ".upsert" do
  it "creates entries for the kottke atom feed" do
    VCR.use_cassette("kottke_feed") do
      kottke_url = "http://feeds.kottke.org/main"
      parsed_kottke_feed = Feedjira::Feed.fetch_and_parse(kottke_url)
      feed = create(:feed, :kottke)

      feed.entries.upsert!(parsed_kottke_feed.entries.first)

      expect(feed.entries.count).to eq(1)
      expect(feed.entries.first.title).
        to eq parsed_kottke_feed.entries.first["title"]
    end
  end

  it "creates entries for my (joeloliveira.com) rss feed" do
    VCR.use_cassette("joel_feed") do
      jo_url = "http://www.joeloliveira.com/rss.xml"
      parsed_jo_feed = Feedjira::Feed.fetch_and_parse(jo_url)
      feed = create(:feed, :joeloliveira)

      feed.entries.upsert!(parsed_jo_feed.entries.first)

      expect(feed.entries.count).to eq(1)
    end
  end
end
