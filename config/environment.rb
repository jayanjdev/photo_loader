require 'active_record'
require 'yaml'
require 'logger'


MIGRATION_DIR = 'db/migrate'
LOG_DIR = 'log'
TMP_DIR = 'tmp'
CONFIG_DIR = 'config'

require_relative '../models/photo'
require_relative '../lib/black_hole_manager'
require_relative '../lib/photo_loader'
require_relative '../lib/photo_detector'
