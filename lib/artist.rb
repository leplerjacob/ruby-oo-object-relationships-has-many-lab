require 'pry'
class Artist
    attr_reader :name
    attr_accessor :songs

    def initialize(name)
        @name = name
        @songs = []
    end

    def add_song(song)
        @songs << song
        song.artist = self
    end

    def songs
        # @songs
        Song.all.select{|song| song.artist == self}
    end

    def add_song_by_name(name)
        new_song = Song.new(name)
        self.songs << new_song
        new_song.artist = self
    end

    def self.song_count
        Song.all.count
    end
end