class PostBroadcastJob < ApplicationJob
  queue_as :default

  def perform(post)
    ActionCable.server.broadcast "room_channel_#{post.room_id}", post: render_post(post)
  end

  private

  def render_post(post)
    ApplicationController.renderer.render(partial: 'posts/post', locals: { post: post })
  end
end
