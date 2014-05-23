APP_ENV = 'test'
require 'database_cleaner'
require_relative '../config/environment.rb'

PhotoLoader::Application.init

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.logger = PhotoLoader.logger
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
    FileUtils.rm_rf("#{ARCHIVE_BASE}/*.*")
  end
end
