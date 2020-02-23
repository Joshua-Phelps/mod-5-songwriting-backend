class VersionSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :recording 
end
