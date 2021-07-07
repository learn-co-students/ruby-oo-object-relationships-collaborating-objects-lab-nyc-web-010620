require_relative './artist.rb'
require_relative './song.rb'
require 'pry'

class MP3Importer
    attr_reader :path
    @@all = []
    def initialize(file_path)
        @path = file_path
    @@all << self
    end

    def self.all
        @@all
    end

    def files 
        new_files = Dir[@path + "/*"]
        new_files.map do |file|
          file.split("/")[-1]
        end 
      end 

      def import
        files.each do |file_name|
          Song.new_by_filename(file_name) 
        end 
      end 

end
