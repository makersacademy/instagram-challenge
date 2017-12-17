class PostsController < ApplicationController
  def index
    p current_user
    @posts = Post.all
  end

  def new
    redirect_to '/users/sign_in' unless user_signed_in?
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)


    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_path
  end

  def show
    @post = Post.find(params[:id])
  end

  def upvote
    @post = Post.find(params[:id])
    @post.upvote_by current_user
    redirect_to posts_path
  end

def downvote
  @post = Post.find(params[:id])
  @post.downvote_by current_user
  redirect_to posts_path
end

  private

  def post_params
    params.require(:post).permit(:caption, :image, :user_id)
  end
end
