require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    self.all << song
    song
  end

  def self.new_by_name(track)
    song = Song.new
    song.name = track
    song
  end

  def self.create_by_name(track)
    song = self.create
    song.name = track
    song
  end

  def self.find_by_name(track)
    self.all.find {|t| t.name == track}
  end

  def self.find_or_create_by_name(track)
    self.find_by_name(track) || self.create_by_name(track)
  end

  def self.alphabetical
    self.all.sort_by{|t| t.name}
  end

  def self.new_from_filename(file)
    file = file.split("-")
    track = file[1].strip.gsub(".mp3","")
    artist = file[0].strip
    song = self.new
    song.name = track
    song.artist_name = artist
    song
  end

  def self.create_from_filename(file)
    file = file.split("-")
    track = file[1].strip.gsub(".mp3","")
    artist = file[0].strip
    song = self.create
    song.name = track
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all = []
  end

end
