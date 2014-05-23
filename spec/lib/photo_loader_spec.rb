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
    it "builds a photo record" do
      black_hole_manager = PhotoLoader::BlackHoleManager.new('black_hole')
      black_hole_manager.stub(:remove)
      photo_loader = PhotoLoader::Loader.new(APP_ROOT + '/spec/fixtures/test.jpg', black_hole_manager)
      photo_loader.load
      Pathname.new(Photo.first.location).basename.to_s.should eql('test.jpg')
    end
  end
end
