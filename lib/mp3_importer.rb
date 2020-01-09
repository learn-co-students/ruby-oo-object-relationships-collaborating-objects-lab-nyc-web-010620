require 'artist'
require 'song'
require 'pry'

class MP3Importer
    attr_reader :path

    def initialize(filepath)
        @path = filepath
    end

    def files
        # MP3Importer #files loads all the mp3 files in the path directory
        # MP3Importer #files normalizes the filename to just the mp3 filename with no path
        file_list = Dir["#{@path}/*"]
        #binding.pry
        file_names = file_list.map { |file| file.split('/')[-1] }
    end

    def import
        # MP3Importer #import imports the files into the library by creating songs from a filename
        self.files.each do |file|
            Song.new_by_filename(file)
        end
    end

end