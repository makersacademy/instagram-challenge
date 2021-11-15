class PostsController < ApplicationController

  def create
    Post.create(post_params)
    redirect_to root_path # reloads page (actually redirects to homepage).
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy

    redirect_to user_path(current_user)
  end


  private
  def post_params
    params.require(:post).permit(:description, :image, :user_id)
  end
  #Rails Strong Parameters

end
