class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params[:room_id]}"
    logger.debug "購読開始".inspect
    #@request.session[:user_tmp_id] = generateUniqueNum
    #RoomParticipant.create(room_id: params[:room_id], user_id: @request.session[:user_tmp_id])
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    logger.debug "購読解除".inspect
    #@room_participants = RoomParticipant.find_by(user_id: @request.session[:user_tmp_id])
    #@room_participants.delete
    #@request.session[:user_tmp_id].clear
  end

  def speak(data)
    #Rails.logger.debug data.inspect
    @room = Room.find_by(id: data['room_id'])
    @room.posts.create(body: data['post'])
  end

  private

    def generateUniqueNum
      num = rand(9999999)
      while RoomParticipant.find_by(user_id: num) do
        num = rand(9999999)
      end
      return num
    end

end
