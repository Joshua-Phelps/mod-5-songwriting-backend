class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :collections, :songs
  has_many :collections
  has_many :songs, through: :collections
  

  # def number_of_collections
  #   number_of_collections = self.object.collections.length
  #   number_of_collections
  # end 

  def collections 
    sorted_collections = object.collections.order({ created_at: :desc })
  end 

  def songs 
    sorted_songs = object.songs.order({ created_at: :desc })
  end 

  # def versions
  #   sorted_versions = object.versions.order({ created_at: :desc })
  # end 

end
