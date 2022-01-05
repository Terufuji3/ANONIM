class RoomsController < ApplicationController
  def index
    @rooms = Room.all
    @newRoom = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @posts = Post.where(room_id: params[:id])
    @post = Post.new
  end

  def create
    @room = Room.new(room_params)
    @room.save
    redirect_to rooms_index_path
  end

  private
    def room_params
      params.require(:room).permit(:title)
    end
end
