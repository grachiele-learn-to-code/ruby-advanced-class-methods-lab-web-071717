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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    new_song = self.new
    new_song.name = song_name
    new_song.save
    new_song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      if song.name == song_name
        song
      end
    end
   end

   def self.find_or_create_by_name(song_name)
     if self.find_by_name(song_name) == nil
       self.create_by_name(song_name)
     else
       self.find_by_name(song_name)
     end
   end

   def self.alphabetical
     self.all.sort_by {|song| song.name}
   end

   def self.new_from_filename(filename)
     song_and_artist = filename[0..-5].split(" - ")

     new_song = self.new
     new_song.artist_name = song_and_artist[0]
     new_song.name = song_and_artist[1]

     new_song
   end

  #  def self.create
  #    new_song = self.new
  #    new_song.save
  #    new_song
  #  end

  def self.create_from_filename(filename)
    song_and_artist = filename[0..-5].split(" - ")

    artist = song_and_artist[0]
    name = song_and_artist[1]

    new_song = self.create_by_name(name)

    new_song.artist_name = artist

    new_song

  end

  def self.destroy_all
    self.all.clear
  end
  
end
