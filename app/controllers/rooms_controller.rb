class RoomsController < ApplicationController
  def index
    @rooms = Room.where(limited_access: 0)
    #@newRoom = Room.new
  end

  def show
    @room = Room.find(params[:id])
    @posts = @room.posts
    @post = @room.posts.new
    if @room.password.present? && session[:joinable_room] != @room.id
      redirect_to confirmation_room_path(@room.id)
    end
    session[:joinable_room] = nil
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

  def confirmation
    @room = Room.find(params[:id])
  end

  def password_check
    @room = Room.find(params[:id])
    if @room.password == params[:password]
      session[:joinable_room] = @room.id
      redirect_to room_path(@room.id)
    else
      redirect_to confirmation_room_path(@room.id)
    end
  end

  private
    def room_params
      params.require(:room).permit(:title, :limited_access, :password, :owner_id)
    end
end
