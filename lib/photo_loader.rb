module PhotoLoader
  class Loader
    attr_reader :file

    def initialize(file, black_hole_manger)
      @black_hole_manager = black_hole_manger
      @file = file
      @black_hole_manager.found(file)
    end

    def load
      begin
        ::PhotoLoader.logger.info("loadding ... file #{file}")
        photo_file = EXIFR::JPEG.new(file)
        new_location = PhotoLoader::Archiver.new(file, photo_file.date_time_original).location
        Photo.create(:location => new_location,
                 :type => 'jpeg',
                 :click_date => photo_file.date_time_original)
      rescue Exception => e
        ::PhotoLoader.logger.error("Error loading file #{file}")
        ::PhotoLoader.logger.error(e.inspect)
      else
        ::PhotoLoader.logger.info("removing... file #{file}")
        @black_hole_manger.remove(file)
      end
    end
  end
end
