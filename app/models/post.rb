class Post < ApplicationRecord
    belongs_to :room
    after_create_commit { PostBroadcastJob.perform_later self }
end
