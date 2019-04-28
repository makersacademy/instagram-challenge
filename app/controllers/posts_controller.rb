class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    if current_user
      if params.require(:post).permit(:photo) != {}
        post = Post.create(post_params)
        redirect_to '/posts'
      else
        flash[:post_failure] = 'Sorry, there was a problem creating your post. Please try again.'
        redirect_to '/posts/new'
      end
    else
      flash[:post_failure_sign_in] = 'Sorry, you must be signed in to post'
      redirect_to '/login'
    end
  end

private

  def post_params
  post = params.permit(:post)
  { caption: post.permit(:caption),
    photo: post.permit(:photo),
    users_id: current_user.id }
  end
end
