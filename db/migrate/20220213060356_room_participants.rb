class RoomParticipants < ActiveRecord::Migration[6.0]
  def change
    drop_table :room_participants
  end
end
