class RoomBookmarksController < ApplicationController
    def create
        bookmark = current_user.room_bookmarks.build(bookmark_params)
        bookmark.save
        redirect_to room_path(bookmark_params[:room_id])
    end

    def destroy
        if bookmark = current_user.room_bookmarks.find_by(room_id: bookmark_params[:room_id])
            bookmark.destroy
        end
        redirect_to room_path(bookmark_params[:room_id])
    end

    private
        def bookmark_params
            params.require(:room_bookmark).permit(:room_id)
        end
end
