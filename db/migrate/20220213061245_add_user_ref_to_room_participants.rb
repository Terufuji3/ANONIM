class AddUserRefToRoomParticipants < ActiveRecord::Migration[6.0]
  def change
    add_reference :room_participants, :user, null: false, foreign_key: true
  end
end
