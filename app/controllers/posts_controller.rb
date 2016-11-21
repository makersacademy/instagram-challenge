class PostsController < ApplicationController

  def new
    if !current_user
      flash[:error] = "You must be signed in to post"
      @post = Post.new
    else
      @post = Post.new
    end
  end

  def create
    if current_user
      @post = current_user.post.new(image_params)
        if @post.save
          flash[:success] = "Post added"
          redirect_to posts_path
        else
          render 'new'
        end
    else
      flash[:error] = "You mmust be signed in to post"
      redirect_to new_user_session_path
    end
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

private

def image_params
  params.require(:post).permit(:image, :tag)
end

end
