# frozen_string_literal: true
require "rick_rss"
require "pry"
require "database_cleaner"

ENV["db"] = "test"

RSpec.configure do |config|
  config.shared_context_metadata_behavior = :apply_to_host_groups
  config.filter_run_when_matching :focus
  config.example_status_persistence_file_path = "spec/.examples"
  config.disable_monkey_patching!
  config.warnings = true
  config.profile_examples = 10
  config.order = :random
  config.default_formatter = 'doc'if config.files_to_run.one?

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.before(:suite) do
    RickRss::Init.call &&
      DatabaseCleaner.clean_with(:deletion)
  end

  config.before(:each) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

  Kernel.srand config.seed
end
