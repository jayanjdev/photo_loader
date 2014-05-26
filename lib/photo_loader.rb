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
        photo_file = PhotoLoader::DetailsExtractor.new(file).data
        archiver = PhotoLoader::Archiver.new(file, photo_file.date_time_original || photo_file.date_time)
        archiver.archive
        if archiver.location
          photo = Photo.new(:location => archiver.location,
                   :click_date => photo_file.date_time_original)
          photo.save
          @black_hole_manager.remove(file)
        end
      end
    end
  end
end
