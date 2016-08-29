class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_by_params, only: [:edit, :update, :destroy, :post_owner]
  before_action :post_owner, only: [:update, :destroy, :edit]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user = current_user
    if @post.save
      post_params[:caption].scan(/(?<=#)\w+/).map do |tag|
        @post.tags << Tag.where(tag_text: tag).first_or_create
      end
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def destroy
    find_by_params
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to '/profile'
  end

  def edit
    find_by_params
  end

  def update
    find_by_params
    @post.update(post_params)
    flash[:notice] = 'Post updated successfully'
    redirect_to '/profile'
  end

private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def find_by_params
    @post = Post.find(params[:id])
  end

  def post_owner
    unless @post.user == current_user
      flash[:notice] = 'You must be the post owner to edit/delete posts.'
      redirect_to posts_path
    end
  end


end
