require "pry"

class Artist 
  
attr_accessor :name

@@all = []
  
  def initialize(name)
    @name = name 
    @@all.push(self)
  end 
  
  def self.all 
    @@all
  end 
  
  def add_song(song_name)
    song_name.artist = self
  end 
  
  def songs
    Song.all.select do |object|
      object.artist == self
    end 
  end 
  
  
  def self.create_by_name(song_name) 
   new_song  = self.new(song_name)
   new_song.name = song_name
   new_song
  end 
  
  def self.find_by_name(song_name)
    @@all.find{|x| x.name == song_name}
  end 
  
  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end 
  
  def print_songs 
    Song.all.each do |songs|
      if songs.artist == self 
        puts songs.name 
      end 
    end 
  end 
  
  
end 