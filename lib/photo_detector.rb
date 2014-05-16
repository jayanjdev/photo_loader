class PhotoDetector
  extend Forwardable

  def initialize(dirs)
    @black_hole_manager = BlackHoleManager.new(dirs)

    @listener = Listen.to(@black_hole_manger.black_holes) do |modified, added, removed|
      added.each do |file|
        PhotoLoader.new(file, @black_hole_manager).load
      end
      removed.each do |file|
        @black_hole_manager.remove(file)
      end
    end
  end
  def_delegators :@listener, :start
end

