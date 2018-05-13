class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(picture_params)
    @post.avatar = params[:post][:avatar]
    
    if @post.save
      flash[:success] = "Picture created!"
      redirect_to root_url
    else
      render 'home/index'
    end
  end

  private

  def picture_params
    params.require(:post).permit(:title, :image)
  end
end