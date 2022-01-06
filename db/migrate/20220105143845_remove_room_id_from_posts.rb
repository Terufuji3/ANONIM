class RemoveRoomIdFromPosts < ActiveRecord::Migration[6.0]
  def change
    remove_column :posts, :room_id, :integer
  end
end
