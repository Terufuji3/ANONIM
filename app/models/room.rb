class Room < ApplicationRecord
    validates :title, presence: true
    #validates :password, presence: true

    has_many :posts
    has_many :users
    has_many :room_participants
    has_many :participants, through: :room_participants, source: :user
    belongs_to :owner, class_name: "User", foreign_key: "owner_id"
    has_many :room_bookmarks
end