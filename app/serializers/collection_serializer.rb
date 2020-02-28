class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :collection_name, :number_of_songs
  has_many :songs
  
  def number_of_songs
    number_of_songs = object.songs.length
    number_of_songs 
  end 
  
end
