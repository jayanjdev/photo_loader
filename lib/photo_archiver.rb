module PhotoLoader
  class Archiver
    attr_reader :file_original_date 

    def initialize(src_file_path, file_date)
      #data format 2014-03-09 21:39:32 -0700
     @file_original_date = file_date
     prep_folder
     copy_file(src_file_path)
    end

    def dst_folder
      sub_folder = (file_original_date.is_a?(String) ? Time.parse(file_original_date) : file_original_date).strftime("%Y_%m_%d")
      @dst_folder ||= ARCHIVE_BASE + '/' + sub_folder
    end

    def copy_file(f)
      ::PhotoLoader.logger.info("copying ... file #{f} to #{dst_file_path(f)}")
      FileUtils.cp(f, dst_file_path(f), {preserve: true})
    end

    def location
      @location
    end

    def dst_file_path(f)
      @location ||= File.join(dst_folder, Pathname.new(f).basename.to_s)
    end

    def prep_folder
      begin
        FileUtils.mkdir(dst_folder)
      rescue Errno::EEXIST
      end
    end
  end
end

