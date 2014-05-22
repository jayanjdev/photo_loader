module PhotoLoader
  class BlackHoleManager
    attr_reader :files, :black_holes

    def initialize(black_holes)
      @black_holes= black_holes #there a nothing but folder for now
      @files = []
    end

    def found(f)
      @files << f
    end

    def remove(f)
      @files.delete(f)
    end
  end
end
