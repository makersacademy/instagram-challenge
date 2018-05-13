class PostsController < ApplicationController
  def create
    @post = current_user.posts.build(picture_params)
    @post.picture = params[:post][:picture]
    
    flash[:success] = "Picture created!" if @post.save
  
    redirect_to root_url
  end

  private

  def picture_params
    params.require(:post).permit(:title, :image)
  end
end