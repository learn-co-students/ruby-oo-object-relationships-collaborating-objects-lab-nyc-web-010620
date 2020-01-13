require "pry"
class Song 
  attr_accessor :name, :artist
  
  @@all = []
  
  def initialize(name)
    @name = name 
    @@all.push(self)
  end 
  
  def self.all 
    @@all
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