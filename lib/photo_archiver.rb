module PhotoLoader
  class Archiver
    attr_reader :location, :sub_folder, :filename, :src_file_path

    def initialize(src_file_path, file_date)
      #data format 2014-03-09 21:39:32 -0700
     @sub_folder= Time.parse(file_date.to_s).strftime("%Y_%m_%d")
     @filename = Pathname.new(src_file_path).basename.to_s
     @src_file_path = src_file_path
    end

    def archive
      prep_folder
      @location = copy_file(src_file_path, dst_folder)
    end

    def copy_file(src_file, dst_folder)
      ::PhotoLoader.logger.info("copying ... file #{src_file} to #{dst_folder}")

      begin
        FileUtils.cp(src_file, dst_folder, {preserve: true})
      rescue Exception => e 
        ::PhotoLoader.logger.error("copy failed with error #{e.inspect}")
      else
        File.join(dst_folder, filename) 
      end
    end

    def dst_folder
      @dst_folder ||= File.join(ARCHIVE_BASE, sub_folder)
    end

    def prep_folder
      begin
        FileUtils.mkdir_p(dst_folder)
      rescue Errno::EEXIST

      end
    end
  end
end

