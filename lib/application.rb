module PhotoLoader
  class Application
    def self.config
      @config ||= YAML.load_file(DATABASE_CONFIG_FILE)[APP_ENV]
    end

    def self.init
      ActiveRecord::Base.establish_connection Application.config
    end
  end
end
