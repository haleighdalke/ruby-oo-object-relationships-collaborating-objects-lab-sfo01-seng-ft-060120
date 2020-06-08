require 'pry'

class MP3Importer

    attr_accessor :path, :files

    def initialize(path)
        @path = path
    end

    def files
        @files = []
        @files = Dir[self.path + "/*"]
        @files.map do |file| 
            file.slice!("#{@path}/") 
            file
        end
    end

    def import
        self.files.each {|file| Song.new_by_filename(file)}
    end


end