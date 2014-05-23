module PhotoLoader
  class Application
    def self.config
      @config ||= YAML.load_file(DATABASE_CONFIG_FILE)[APP_ENV]
    end

    def self.init
      ActiveRecord::Base.logger = Logger.new(File.open(DB_LOG_FILE, 'a+'))
      ActiveRecord::Base.establish_connection Application.config
    end
  end
end
