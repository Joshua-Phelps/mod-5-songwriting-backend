class VersionSerializer < ActiveModel::Serializer
  attributes :id, :title, :song_id, :recording
  has_one :recording 
end
