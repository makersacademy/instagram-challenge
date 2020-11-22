class PostsController < ApplicationController

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to dashboard_path, flash: { success: "Post was created successfully!"}
    else
      redirect_to new_post_path, flash: { danger: "Post was not uploaded!" }
    end
  end

  def show
  end

  private

  def post_params
    params.require(:post).permit(:image)
  end


end