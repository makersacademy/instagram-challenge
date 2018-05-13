class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(picture_params)
    @post.picture = params[:post][:picture]
    
    if @post.save
       flash[:success] = "Picture created!"
       redirect_to root_url
    else 
       redirect_to root_url, :status => 503
    end
  end

  private

  def picture_params
    params.require(:post).permit(:title, :image)
  end
end