class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(messages: user_params[:messages],
                    user_id: current_user.id,
                    image: user_params[:image])
    puts @post.user_id
    if @post.save
      redirect_to posts_url
      flash[:success] = 'you have grammed your photo'
    else
      flash[:error] = @post.errors.full_messages
      redirect_to posts_new_path
    end
  end

  def show
    @post = Post.find(params[:id])
  end

  def index
    @posts = Post.all.reverse
  end

  private

  def user_params
    params.require(:post).permit(:image,:messages)
  end
end
