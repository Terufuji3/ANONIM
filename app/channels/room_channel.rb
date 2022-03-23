class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    #Rails.logger.debug data.inspect
    @room = Room.find_by(id: data['room_id'])
    @room.posts.create(body: data['post'])
  end
end
