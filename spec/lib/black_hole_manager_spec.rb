require 'spec_helper'

describe PhotoLoader::BlackHoleManager do
  describe "#delete" do
    it "removes the file from managed files list" do
      blk_ho_mgr = PhotoLoader::BlackHoleManager.new('/a')
      blk_ho_mgr.found('a')
      blk_ho_mgr.files.should eql(['a'])
      blk_ho_mgr.remove('a')
      blk_ho_mgr.files.should eql([])
    end
  end

  describe "#found" do
    it "adds the file to managed files list" do
      blk_ho_mgr = PhotoLoader::BlackHoleManager.new('/a')
      blk_ho_mgr.found('a')
      blk_ho_mgr.files.should eql(['a'])
    end
  end
end
