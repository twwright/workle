ENV['RAILS_ENV'] ||= 'test'

require File.expand_path('../config/environment', __dir__)

abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'spec_helper'

# Warden test helpers to mimic logging in
include Warden::Test::Helpers
Warden.test_mode!

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end

Capybara.default_max_wait_time = 15

RSpec.configure do |config|
  config.fixture_path = "#{::Rails.root}/spec/fixtures"
  config.use_transactional_fixtures = true

  # DatabaseCleaners to clean up after tests
  config.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
  config.before(:each) { DatabaseCleaner.strategy = :transaction }
  config.before(:each, :js => true) { DatabaseCleaner.strategy = :truncation }
  config.before(:each) {DatabaseCleaner.start }
  config.after(:each) { DatabaseCleaner.clean }

  config.infer_spec_type_from_file_location!
  config.filter_rails_from_backtrace!

  # FactoryGirl for testing seeds
  config.include FactoryBot::Syntax::Methods
end
