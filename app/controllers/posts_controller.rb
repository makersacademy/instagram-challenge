class PostsController < ApplicationController

  def index
    @user_posts = get_users_posts
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


  def post_params
    params.require(:post).permit(:title)
  end

  def get_users_posts
    current_user ? current_user.posts.sort_by{ |p| p[:created_at] }.reverse : nil
  end

end
