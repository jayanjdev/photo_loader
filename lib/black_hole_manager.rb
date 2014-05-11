require 'listen'

class BlackHoleManager

  def initialize(dirs)
    @dirs = dirs
    @files = []
  end

  def black_holes
    @dirs
  end

  def found(f)
    @files << f
  end

  def remove(f)
    @files.delete(f)
  end
end

