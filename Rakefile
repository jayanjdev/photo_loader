require_relative 'lib/photo_loader'

desc "Automatic Photo Loader"
task :photo_detector, [ :directories ] do |t, args|
  p_loader = PhotoLoader.new(args.directories.split(";"))
  p_loader.start
  sleep
end
