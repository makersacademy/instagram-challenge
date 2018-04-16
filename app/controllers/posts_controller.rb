class PostsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_post, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:destroy]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.create(post_params)

    if @post.save
      redirect_to posts_url
    else
      render 'new'
    end

  end

  def update
    @post.update(post_params)
    redirect_to posts_path
  end

  def destroy
    if (@user.id.to_i != @post.user_id.to_i)
      flash[:notice] = "You can't delete this post"
    else
      @post.destroy
    end

    redirect_to posts_path
  end

  private

    def post_params
      params.require(:post).permit(:photo, :desc).merge(user_id: current_user.id)
    end

    def find_post
      @post = Post.find(params[:id])
    end

    def find_user
      @user = User.find(current_user.id)
    end

end
