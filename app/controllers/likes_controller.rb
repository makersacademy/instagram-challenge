class LikesController < ApplicationController


  def create
    @post = Post.find(params[:post_id])
    @like = Like.new
    @like.user_id = current_user.id
    @like.post_id = params[:post_id]
    if @like.save 
      flash[:alert] = 'you have liked a post'
      redirect_to post_path(@post)
    else 
      render :new, error: 'like not recorded'
    end 

  end 



end
