class AddUserRefToRoomBookmarks < ActiveRecord::Migration[6.0]
  def change
    add_reference :room_bookmarks, :user, null: false, foreign_key: true
  end
end
