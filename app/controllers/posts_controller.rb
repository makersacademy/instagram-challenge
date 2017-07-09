class PostsController < ApplicationController

  before_action :require_login

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @comments = @post.comments
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to post_path(@post), notice: "Post created!"
    else
      p params
      @errors = @post.errors.full_messages
      render :new
    end

  end

  private

  def post_params
    params.require(:post).permit(:description, :image)
  end

end
