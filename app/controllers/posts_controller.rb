class PostsController < ApplicationController
  def index
    @posts = Post.all.reverse
  end

  def new
    @post = Post.new
  end

  def create
    user = User.find(current_user.id)
    @post = user.posts.create(post_params)

    if @post.save
      redirect_to posts_url, notice: 'Image was successfully posted.'
    else
      render action: 'new'
    end
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def destroy
    Post.find(params[:id]).delete
  end

  private

  def post_params
    params.require(:post).permit(:image, :title)
  end
end
