class Artist

    attr_accessor :name, :songs
    
    @@all = []

    def self.all
        @@all
    end

    def initialize(name)
        @name = name

        @@all << self
    end
    
    def songs
        Song.all.select { |song| song.artist == self }
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.find { |artist| artist.name == name } ? self.all.find { |artist| artist.name == name } : self.new(name)
    end

    def print_songs
        songs.each{ |song| puts song.name }
    end

end