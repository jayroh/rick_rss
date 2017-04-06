# frozen_string_literal: true
FactoryGirl.define do
  factory :feed, class: RickRss::Feed do
    title "Random Rss Feed"
    url  "http://example.com/rss.xml"

    trait :kottke do
      title "kottke.org"
      url "http://feeds.kottke.org/main"
    end

    trait :joeloliveira do
      title "joeloliveira.com"
      url "http://www.joeloliveira.com/rss.xml"
    end
  end

  # This will use the User class (Admin would have been guessed)
  factory :entry, class: RickRss::Entry do
    title "Article title"
    url  "http://example.com/article-title"

    feed
  end
end
