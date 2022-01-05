class RemoveColumnFromRooms < ActiveRecord::Migration[6.0]
  def change
    remove_column :rooms, :room_id, :integer
  end
end
