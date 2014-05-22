require 'spec_helper'

describe PhotoLoader::Loader do
  describe "#new" do
    it "added the file to the black_hole_manager" do 
      black_hole_manager =PhotoLoader::BlackHoleManager.new('black_hole')
      photo_loader = PhotoLoader::Loader.new('f', black_hole_manager)
      black_hole_manager.files.should eql(['f'])
    end
  end

  describe "#load" do
    it "builds a photo model" do
      black_hole_manager = PhotoLoader::BlackHoleManager.new('black_hole')
      photo_loader = PhotoLoader::Loader.new('f', black_hole_manager)
      photo_loader.load
    end
  end
end
