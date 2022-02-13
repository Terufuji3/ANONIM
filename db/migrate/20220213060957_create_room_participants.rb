class CreateRoomParticipants < ActiveRecord::Migration[6.0]
  def change
    create_table :room_participants do |t|

      t.timestamps
    end
  end
end
