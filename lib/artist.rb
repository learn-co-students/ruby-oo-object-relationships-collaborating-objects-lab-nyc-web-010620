require 'song'

class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def songs
        # Artist #songs lists all songs that belong to this artist
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        # Artist .find_or_create_by_name always returns an Artist instance
        # Artist .find_or_create_by_name finds or creates an artist by name maintaining uniqueness of objects by name property
        # Artist .find_or_create_by_name Creates new instance of Artist if none exist

        artist_result = (@@all.select { |artist| artist.name == name })[0]
        if artist_result
            artist_result
        else
            Artist.new(name)
        end
    end

    def print_songs
        # Artist #print_songs lists all of the artist's songs
        self.songs.each { |song| puts song.name }
    end

end