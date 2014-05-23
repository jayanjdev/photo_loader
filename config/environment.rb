require 'active_record'
require 'yaml'
require 'logger'
require 'listen'
require 'exifr'

APP_ENV ||= ENV['APP_ENV'] || 'development'

APP_ROOT = File.join(File.dirname(__FILE__) , '..')

MIGRATION_DIR = 'db/migrate'
DATABASE_CONFIG_FILE = File.join(APP_ROOT, "config/database.yml") 

DB_LOG_FILE = File.join(APP_ROOT, 'log', "#{APP_ENV}_database.log")

TMP_DIR = File.join(APP_ROOT, 'tmp')
CONFIG_DIR = File.join(APP_ROOT, 'config')

ARCHIVE_BASE = File.join(APP_ROOT, "data/#{APP_ENV}/photo_archive")
 

require_relative '../models/photo'
require_relative '../lib/black_hole_manager'
require_relative '../lib/photo_loader'
require_relative '../lib/photo_detector'
require_relative '../lib/photo_archiver'
require_relative '../lib/application'

module PhotoLoader
  def self.logger
    @logger ||= Logger.new(File.open(DB_LOG_FILE , 'a+'))
  end
end


