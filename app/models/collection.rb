class Collection < ApplicationRecord
    belongs_to :user
    has_many :songs
    has_many :versions, through: :songs
end
