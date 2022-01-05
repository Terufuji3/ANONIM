class PostsController < ApplicationController

    def create
        @post = Post.new(post_params)
        @post.save
        redirect_to room_path(post_params[:room_id])
    end

    private
        def post_params
            params.require(:post).permit(:body, :room_id)
        end

end
