module PhotoLoader
  class Loader
    attr_reader :file

    def initialize(file, black_hole_manager)
      @black_hole_manager = black_hole_manager
      @file = file
      @black_hole_manager.found(file)
    end

    def load
      begin
        ::PhotoLoader.logger.info("loadding ... file #{file}")
        photo_file = EXIFR::JPEG.new(file)
        new_location = PhotoLoader::Archiver.new(file, photo_file.date_time_original || photo_file.date_time).location
        ::PhotoLoader.logger.info("createing new record with #{new_location}")
        photo = Photo.new(:location => new_location,
                 :click_date => photo_file.date_time_original)
        photo.save
        ::PhotoLoader.logger.info("created new record #{photo.inspect}")

      rescue Exception => e
        ::PhotoLoader.logger.error("Error loading file #{file}")
        ::PhotoLoader.logger.error(e.inspect)
      else
        ::PhotoLoader.logger.info("removing... file #{file}")
        @black_hole_manager.remove(file)
      end
    end
  end
end
