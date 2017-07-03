class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :require_login, only: [:create, :new, :show]
  before_action :owner_of_post, only: [:edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def new
     @post = current_user.posts.build
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)
    if @post.save
      redirect_to posts_url
    else
      flash[:error] = "Your new post couldn't be created!  Please try again."
      redirect_to new_post_path
    end
  end

  def show
  end

  def edit
  end

  def update
    @post.update(post_params)
    redirect_to(post_path(@post))
  end

  def destroy
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def owner_of_post
  unless current_user == @post.user
    flash[:alert] = "You can't modify a post that's not yours"
    redirect_to root_path
  end
end

end
