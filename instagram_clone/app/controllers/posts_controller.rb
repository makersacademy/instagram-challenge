class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]
  before_action :find_by_params, only: [:show, :edit, :update,
                                        :destroy, :post_owner]
  before_action :post_owner, only: [:update, :destroy, :edit]


  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
      end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    @post.destroy
    flash[:notice] = 'Post deleted successfully'
    redirect_to posts_path
  end

  private

  def post_params
      params.require(:post).permit(:title, :image, :description)
  end

  def find_by_params
    @post = Post.find(params[:id])

  end

  def post_owner
    unless @post.user_id == current_user.id
      flash[:notice] = 'Permission denied: only owner has edit/delete privileges'
      redirect_to posts_path
    end
  end

end
