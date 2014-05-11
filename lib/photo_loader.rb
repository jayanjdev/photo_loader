class PhotoLoader

  def initialize(file, black_hole_manger)
    @black_hole_manager = black_hole_manger
    @file = file
    @black_hole_manager.found(file)
  end
end

