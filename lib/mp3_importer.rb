class MP3Importer
    attr_accessor :path

    def initialize(path)
        @path = path         
    end

    def files
        files = Dir["#{self.path}/*"]
        files.map { |file| file.split("/")[-1] }
    end

    def import  
        self.files.each { |song_file| Song.new_by_filename(song_file) }
    end
end
