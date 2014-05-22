require 'active_record'
require 'yaml'
require 'logger'
require 'listen'
require 'exifr'


MIGRATION_DIR = 'db/migrate'
LOG_DIR = 'log'
TMP_DIR = 'tmp'
CONFIG_DIR = 'config'

require_relative '../models/photo'
require_relative '../lib/black_hole_manager'
require_relative '../lib/photo_loader'
require_relative '../lib/photo_detector'

module PhotoLoader
  def self.logger
    @logger ||= Logger.new(File.open(LOG_DIR + '/photo_load_log.log' , 'a+'))
  end
end
