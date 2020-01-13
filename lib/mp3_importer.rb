require "pry"

class MP3Importer
   attr_accessor :path

   def initialize(path)
      @path = path
   end 

   def files 
      # loads all the mp3 files in the path directory
      file = Dir["#{self.path}/*"] # * means "all"
      # normalizes the filename to just the mp3 filename with no path
      file = file.map{|path| path.split("/")[-1]}
      # binding.pry 
   end 

   # first, we get the file name using the #files method 
   # and then we pass each of the results from invoking that method 
   # to call on the self.new_by_filename(file) method
   def import
       self.files.each do |file|
         Song.new_by_filename(file)
       end 
   end 

end 