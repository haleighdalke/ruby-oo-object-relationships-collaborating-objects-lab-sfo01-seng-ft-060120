require 'pry'

class Song

    attr_accessor :name, :artist

    @@all = [ ]

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_array = filename.split(" - ")
        song_name = song_array[1]
        artist = song_array[0]

        song = Song.new(song_name)
        song.artist_name=artist
        song
    end

    def artist_name=(name)
        artist = Artist.find_or_create_by_name(name)
        artist.add_song(self)
    end

end