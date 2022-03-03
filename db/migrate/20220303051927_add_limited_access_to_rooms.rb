class AddLimitedAccessToRooms < ActiveRecord::Migration[6.0]
  def change
    add_column :rooms, :limited_access, :boolean, default: false
  end
end
