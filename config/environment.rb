require 'active_record'
require 'yaml'
require 'logger'
require 'listen'
require 'exifr'

APP_ENV ||= ENV['APP_ENV'] || 'development'

MIGRATION_DIR = 'db/migrate'
LOG_DIR = 'log'
TMP_DIR = 'tmp'
CONFIG_DIR = 'config'
ARCHIVE_BASE = "data/#{APP_ENV}/photo_archive"
DATABASE_CONFIG_FILE = "config/database.yml"
 

require_relative '../models/photo'
require_relative '../lib/black_hole_manager'
require_relative '../lib/photo_loader'
require_relative '../lib/photo_detector'
require_relative '../lib/photo_archiver'
require_relative '../lib/application'

module PhotoLoader
  def self.logger
    @logger ||= Logger.new(File.open(LOG_DIR + "/#{APP_ENV}_photo_load_log.log" , 'a+'))
  end
end

