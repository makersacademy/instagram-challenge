class PostsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  # def create
  #   @restaurant = current_user.restaurants.new(restaurant_params)
  #   if @restaurant.save
  #     redirect_to restaurants_path
  #   else
  #     render 'new'
  #   end
  # end




  def post_params
    params.require(:post).permit(:text, :image)
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    if current_user.id != @post.user_id
      redirect_to posts_path
      flash[:notice] = "You don't have permission to delete that"
    else
      @post.destroy
      flash[:notice] = 'Post deleted successfully'
      redirect_to posts_path
    end
  end


end
