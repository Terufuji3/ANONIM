class AddColomnToRoomParticipants < ActiveRecord::Migration[6.0]
  def change
    add_column :room_participants, :host, :boolean, default: false, null: false
    add_column :room_participants, :moderator, :boolean, default: false, null: false
  end
end
