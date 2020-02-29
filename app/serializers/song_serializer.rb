class SongSerializer < ActiveModel::Serializer
  attributes :id, :title, :lyrics, :collection_id, :number_of_versions
  has_many :versions 

  def number_of_versions
    number_of_versions = object.versions.length
  end 

  def versions
    sorted_versions = object.versions.order({ created_at: :desc }) 
  end 

end
