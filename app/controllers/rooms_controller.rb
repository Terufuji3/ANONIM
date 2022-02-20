class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    #@newRoom = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
    @post = @room.posts.new
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      @room.room_participants.create(user_id: room_params[:owner_id])
    end
    redirect_to room_path(@room.id)
  end

  def new
    @newRoom = Room.new
  end

  private
    def room_params
      params.require(:room).permit(:title, :owner_id)
    end
end
