require_relative './mp3_importer.rb'
require_relative './artist.rb'
require 'pry'

class Song
    attr_reader :name, :artist
    @@all = []
    def initialize(name)
        @name = name
        @artist = artist
        @@all << self
    end

    def self.all
        @@all
    end

    def name=(input)
        @name = input
    end

    def artist=(input)
        @artist = input
    end

    def self.new_by_filename(file_name) 
        song1 = Song.new(file_name.split("-")[1].strip)
        song1.artist_name = file_name.split("-")[0].strip
        song1
      end 
      
      def artist_name=(artist_name)
        self.artist = Artist.find_or_create_by_name(artist_name)
      end 

end