require_relative 'lib/photo_detector'

desc "Automatic Photo Loader"
task :photo_detector, [ :directories ] do |t, args|
  p_loader = PhotoDetector.new(args.directories.split(";"))
  p_loader.start
  sleep
end
