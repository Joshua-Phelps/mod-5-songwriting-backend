class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :collection_name
  has_many :songs 
end
