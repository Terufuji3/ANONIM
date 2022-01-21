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
    @room.save
    redirect_to room_path(@room.id)
  end

  def new
    @newRoom = Room.new
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end
end
