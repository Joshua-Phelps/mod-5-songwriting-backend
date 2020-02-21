class Song < ApplicationRecord
    belongs_to :collection
    has_many :versions
end
