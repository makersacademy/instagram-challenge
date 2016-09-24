class PostsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :find_post, only: [:show, :edit, :update, :destroy, :upvote]

  def new
    @post = current_user.posts.build
  end

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def show
  end

  def create
    @post = current_user.posts.build(permit_post)

    if @post.save
      redirect_to @post, notice: "Success!"
    else
      render 'new'
    end
  end

  def edit
  end

  def destroy
    @post.destroy
    redirect_to root_path
  end

  def update
    if @post.update(permit_post)
      redirect_to @post, notice: "Success!"
    else
      render 'edit'
    end
  end

  def upvote
    @post.upvote_by current_user
    redirect_to :back
  end

  private

  def permit_post
    params.require(:post).permit(:title, :description, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
