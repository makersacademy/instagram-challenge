class PostsController < ApplicationController
  def create
    @user = User.create(username: "Sarah", email: "sarah@email.com", password_digest: "bob")
    @post = @user.posts.create(post_params)
    @post.photo.attach
    redirect_to posts_url
  end

  def index
    @post = Post.new
    @posts = Post.all.order("created_at DESC")
  end

  private

  def post_params
    params.require(:post).permit(:message, :created_at, :photo)
  end
end

