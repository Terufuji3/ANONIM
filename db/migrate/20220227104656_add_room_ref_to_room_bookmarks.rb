class AddRoomRefToRoomBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_reference :room_bookmarks, :room, null: false, foreign_key: true
  end
end
