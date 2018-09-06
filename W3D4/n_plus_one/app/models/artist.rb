class Artist < ApplicationRecord
  has_many :albums,
    class_name: 'Album',
    foreign_key: :artist_id,
    primary_key: :id

  def n_plus_one_tracks
    albums = self.albums
    tracks_count = {}
    albums.each do |album|
      tracks_count[album.title] = album.tracks.length
    end

    tracks_count
  end

   def better_tracks_query
    arr = self.albums.select('albums.*, COUNT(*) AS album_tracks').joins(:tracks).group('albums.id')
    hash = {}
    arr.each do |el|
      hash[el.title] = el.album_tracks
    end
    hash
  end




end
