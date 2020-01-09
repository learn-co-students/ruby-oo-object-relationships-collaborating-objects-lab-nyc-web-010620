require 'pry'
require 'artist'

class Song

    attr_accessor :name, :artist
    # Song #name= sets the song name
    # Song #artist= sets the artist object to belong to the song

    @@all = []

    def initialize(name)
        # Song #initialize with a name accepts a name for the song and makes it accessible through an attribute accessor
        @name = name
        @@all << self
        @artist = nil
    end

    def self.all
        # Song .all returns all existing Song instances
        @@all
    end

    def self.new_by_filename(filename)
        # Song .new_by_filename creates a new instance of a song from the file that's passed
        # Song .new_by_filename associates new song instance with the artist from the filename
 #       binding.pry
        filename_split = filename.split("-")
        file_artist = filename_split[0].strip
        file_name = filename_split[1].strip
        song = self.new(file_name)
        song.artist_name = file_artist
        song
    end

    def artist_name=(artist)
        # Song #artist_name= accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
        artist_result = (Artist.all.find { |singer| singer.name == artist})
        if artist_result
            @artist = artist_result
        else
            new_artist = Artist.new(artist)
            @artist = new_artist
        end
    end

end