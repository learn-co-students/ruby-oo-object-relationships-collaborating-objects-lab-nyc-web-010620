class MP3Importer 
  
  attr_accessor :path
  
  # @@files = []
  
  def initialize(file_path)
    @path = file_path
    # @@files.push(self)
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