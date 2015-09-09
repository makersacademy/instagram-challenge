class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create
    # p '---------------'
    # p @final
    # p '--------------'
    render json: { new_like_count: @post.likes.count }
    # else
    #   redirect_to posts_path
    # end
  end

end
