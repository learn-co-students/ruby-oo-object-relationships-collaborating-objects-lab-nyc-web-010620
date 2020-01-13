class Artist
   attr_accessor :name, :song  

   @@all = []

   def initialize(name)
      @name = name 
      
      @@all << self
   end 

   def self.all
      @@all 
   end 

   # lists all songs that belong to this artist 
   def songs
      Song.all.select{|song| song.artist == self}
   end 

   # This instance method exists to tell a passed in Song instance it belongs to this Artist instance
   def add_song(song)
      song.artist = self 
   end 

   # keeps track of an artist's songs
   # always returns an Artist instance
   # finds or creates an artist by name maintaining uniqueness of objects by name property
   # creates new instance of artist if none exist 
   def self.find_or_create_by_name(name)
      if Artist.all.find{|artist| artist.name == name} # if this returns true
         Artist.all.find{|artist| artist.name == name} # return that artist instance 
      else 
         Artist.new(name)
      end 
   end 

   # lists all of the artist's songs 
   def print_songs
      # #songs returns an array of the artist's songs
       songs.each do |song|
         print song.name += "\n"
       end 
   end 

end 
