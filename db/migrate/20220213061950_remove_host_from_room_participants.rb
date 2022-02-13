class RemoveHostFromRoomParticipants < ActiveRecord::Migration[6.0]
  def change
    remove_column :room_participants, :host, :boolean
    remove_column :room_participants, :moderator, :boolean
  end
end
