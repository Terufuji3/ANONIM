class Room < ApplicationRecord
    has_many :posts
    has_many :users, through: :room_participants
end
