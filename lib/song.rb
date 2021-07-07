require 'pry'

class Song
   attr_accessor :name, :artist  

   @@all = []

   def initialize(name)
      @name = name

      @@all << self 
   end 

   def self.all
      @@all
   end 

   # creates a new instance of a song from the file that's passed
   # associates new song instance with the artist from the filename
   def self.new_by_filename(file)
      # file is defined in the MP3Importer class 
      artist_name = file.split(" - ")[0] # this returns a string
      song_name = file.split(" - ")[1]
      # binding.pry
      song = Song.new(song_name)
      # we want to store an object in song.artist (not a string)
      song.artist = Artist.find_or_create_by_name(artist_name) 
      song
   end 

   # accepts an artist's name, finds or creates an Artist instance and assigns it to the Song's artist attribute
   def artist_name=(artist_name)
      artist = Artist.find_or_create_by_name(artist_name)
      self.artist = artist 
   end 

end 