module PhotoLoader
  class Archiver
    attr_reader :file_original_date 

    def initialize(src_file_path, file_date)
      #data format 2014-03-09 21:39:32 -0700
     @file_original_date = file_date
     make_folder(file_date)
     copy_file(src_file_path)
    end

    def dst_folder
      @dst_folder ||= ARCHIVE_BASE + '/' + Time.parse(file_original_date).strftime("%Y_%m_%d")
    end

    def copy_file(f)
      FileUtils.cp(f, dst_file_path(f), {preserve: true})
    end

    def dst_file_path(f)
      File.join(dst_folder, Pathname.new(f).basename.to_s)
    end

    def make_folder
      FileUtils.mkdir(dst_folder)
    end
  end
end

