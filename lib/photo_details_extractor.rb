module PhotoLoader
  class DetailsExtractor
    attr_reader :data

    def initialize(file)
      @data = EXIFR::JPEG.new(file)
    end
  end
end
