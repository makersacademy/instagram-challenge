class PostsController < ApplicationController

  def new
  end

  def create
    @post = current_user.posts.new(posts_params)
    if @post.save
      redirect_to user_path(current_user)
    else
      redirect_to "/users/#{current_user.id}/posts/new"
    end
  end

  private
  def posts_params
    params.require(:post).permit(:title, :link)
  end

end
