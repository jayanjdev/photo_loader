require_relative 'config/environment'

desc "Automatic Photo Loader"
task :photo_detector, [ :directories ] do |t, args|
  p_detector =  PhotoDetector.new(args.directories.split(";"))
  p_detector.start
  sleep
end

namespace :db do
  task :environment do
    APP_ENV = ENV['APP_ENV'] || 'development'
    MIGRATIONS_DIR = ENV['MIGRATIONS_DIR'] || 'db/migrate'
  end

  task :configuration => :environment do
    @config = YAML.load_file('config/database.yml')[APP_ENV]
  end

  task :configure_connection => :configuration do
    ActiveRecord::Base.establish_connection @config
    ActiveRecord::Base.logger = Logger.new(File.open(@config['logger'], 'a+'))
  end

  desc 'Create the database from config/database.yml for the current APP_ENV'
  task :create => :configure_connection do
    begin
      ActiveRecord::Base.establish_connection @config.merge('database' => nil)
      ActiveRecord::Base.connection.create_database @config['database'],{}
      ActiveRecord::Base.establish_connection @config
    rescue Mysql2::Error => e
      puts e.backtrace.inspect
    else
      results = ActiveRecord::Base.connection.execute("SHOW DATABASES;")
      if results.each(&:name).include(@config['database'])
        ActiveRecord::Base.logger("Database #{@config['database']} created.")
      else
        ActiveRecord::Base.logger("Database #{@config['database']} not found on server, but there was no error reported.")
      end
    ensure
      ActiveRecord::Base.connection.disconnect!
    end
  end

  desc 'Drops the database for the current APP_ENV'
  task :drop => :configure_connection do
     ActiveRecord::Base.connection.drop_database @config['database']
  end

  desc 'Migrate the database (options: VERSION=x, VERBOSE=false).'
  task :migrate => :configure_connection do
    ActiveRecord::Migration.verbose = true
    ActiveRecord::Migrator.migrate MIGRATIONS_DIR, ENV['VERSION'] ? ENV['VERSION'].to_i : nil
  end

  desc 'Rolls the schema back to the previous version (specify steps w/ STEP=n).'
  task :rollback => :configure_connection do
    step = ENV['STEP'] ? ENV['STEP'].to_i : 1
    ActiveRecord::Migrator.rollback MIGRATIONS_DIR, step
  end

  desc "Retrieves the current schema version number"
  task :version => :configure_connection do
    puts ActiveRecord::Base.establish_connection @config
    puts ActiveRecord::Base.connection
    puts ActiveRecord::Base.connection.execute("use photo_development;").inspect;
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end

