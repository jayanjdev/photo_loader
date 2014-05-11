require 'listen'

class PhotoLoader
  extend Forwardable

  def initialize(dirs)
    @listener = Listen.to(dirs) do |modified, added, removed|
      puts "modified absolute path: #{modified}"
      puts "added absolute path: #{added}"
      puts "removed absolute path: #{removed}"
    end
  end
  def_delegators :@listener, :start
end

