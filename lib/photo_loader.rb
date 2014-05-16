class PhotoLoader

  def initialize(file, black_hole_manger)
    @black_hole_manager = black_hole_manger
    @file = file
    @black_hole_manager.found(file)
  end

  def purge

  end

  def manual_purge
  end

  def load
    Photo.new(@file, self)
  end

end

