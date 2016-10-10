class PostsController < ApplicationController
  include PostsHelper

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all.order("updated_at DESC")
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user

    if @post.save
      redirect_to posts_path, notice: "Post successfully added."
    else
      render "new"
    end
  end

  def show
   @post = Post.find(params[:id])
   @comments = @post.comments.order("created_at DESC")
   @likes = Like.find_by(post_id: @post.id)
   @likes = [@likes] if @likes.class != Array
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if (current_user.id == @post.user_id)
      @post.update(post_params)
      redirect_to post_path(@post), notice: "Post successfully updated."
    else
      redirect_to post_path(@post), alert: "You cannot update this post."
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if (current_user.id == @post.user_id)
      @post.comments.each { |comment| comment.destroy }
      @post.likes.each { |like| like.destroy }
      @post.destroy
      redirect_to posts_path, notice: "Post successfully deleted."
    else
      redirect_to post_path(@post), alert: "You cannot delete this post."
    end
  end

  private

  def post_params
    params.require(:post).permit(:description, :location, :image)
  end

end
