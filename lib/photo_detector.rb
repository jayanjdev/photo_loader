module PhotoLoader
  class Detector
    extend Forwardable

    def initialize(dirs)
      @black_hole_manager = BlackHoleManager.new(dirs)
      @listener = Listen.to(@black_hole_manager.black_holes) do |modified, added, removed|
        added.each do |file|
          ::PhotoLoader.logger.info("added file #{file}")
          Loader.new(file, @black_hole_manager).load
        end
        removed.each do |file|
          @black_hole_manager.remove(file)
        end
      end
    end
    def_delegators :@listener, :start
  end
end
