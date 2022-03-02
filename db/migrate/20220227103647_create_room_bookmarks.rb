class CreateRoomBookmarks < ActiveRecord::Migration[6.0]
  def change
    create_table :room_bookmarks do |t|

      t.timestamps
    end
  end
end
