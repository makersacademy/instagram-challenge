class UpvotesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.upvotes.create
    redirect_to posts_path
  end

end
