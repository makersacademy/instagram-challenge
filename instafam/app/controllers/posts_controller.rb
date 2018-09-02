class PostsController < ApplicationController

  def index
    @posts = Post.order(created_at: :desc).all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    if @post.save
      flash[:success] = "Successfully created post!"
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.messages
      redirect_to new_post_path
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update_attributes(post_params)
      flash[:success] = 'Post was successfully updated'
      redirect_to post_path(@post)
    else
      flash[:error] = @post.errors.messages
      redirect_to edit_post_path
    end
  end

  def destroy
    @post = Post.find(params[:id])
     if @post.destroy
       flash[:success] = 'Post was successfully deleted'
       redirect_to root_path
     else
       flash[:error] = @post.errors.messages
       redirect_to post_path(@post)
     end
  end

  def mine
    @posts = current_user.posts.order(created_at: :desc)
  end

  private
    def post_params
      params.require(:post).permit(:image, :description).merge(username: current_user.username)
    end
end
