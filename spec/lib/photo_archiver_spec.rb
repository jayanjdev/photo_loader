require "spec_helper"
require "debugger"

describe PhotoLoader::Archiver do
  describe "#new" do
    
  end

  describe "#archive" do
    it "creates the destination folder if it doesnt_exist" do
      src_file = File.join(APP_ROOT, "spec", "fixtures", 'test.jpg')
      date = "2014-03-09 21:39:32 -0700"
      sub_folder = '2014_03_09'

      dst_file =  File.join(ARCHIVE_BASE, sub_folder, 'test.jpg')

      archiver = PhotoLoader::Archiver.new(src_file, date)

      archiver.archive

      archiver.location.should eql(dst_file) 
      File.exists?(dst_file).should be_true
    end
  end


end
