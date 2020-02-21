class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :lyrics
  has_many :versions 
end
