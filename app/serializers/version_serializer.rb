class VersionSerializer < ActiveModel::Serializer
  attributes :id, :title
  belongs_to :song
end
