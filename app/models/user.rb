class User < ApplicationRecord
    has_secure_password
    has_many :collections
    has_many :songs, through: :collections
    has_many :versions, through: :songs
end
