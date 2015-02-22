class PostsController < ApplicationController

  def index
    @user_posts = get_users_posts
    @posts = get_posts
  end

  def new
    @post = Post.new
  end

  def create
    @post =  Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to posts_path
      else
        render 'new'
      end
  end

  def show
    @post = Post.find(params[:id])
  end


  def post_params
    params.require(:post).permit(:image, :title)
  end

  def get_users_posts
    current_user ? current_user.posts.sort_by{ |p| p[:created_at] }.reverse : nil
  end

  def get_posts
    Post.any? ? Post.all.sort_by{ |p| p[:created_at] }.reverse : nil
  end

end
