class AddRoomIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :room_id, :integer
  end
end
