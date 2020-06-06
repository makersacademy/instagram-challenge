class PostsController < ApplicationController

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to :dashboard, flash: { success: "Post was saved successfully!" }
    else
      redirect_to new_post_path, flash: { danger: "Post did not save!" }
    end
  end

  def show

  end

  def show

  end

  private

  def post_params
    params.require(:post).permit(:image, :image_cache)
  end
end