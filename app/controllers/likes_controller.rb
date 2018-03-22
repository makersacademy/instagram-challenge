class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new
    @like.user_id = current_user.id
    @like.save
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.js { render 'update_likes'}
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = @post.likes.find(params[:id])
    if User.find(@like.user_id) == current_user
      @like.destroy
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js { render 'update_likes'}
      end
    else
      respond_to do |format|
        format.html { redirect_to posts_url }
        format.js { render "alert('You may not delete this comment');"}
      end
    end
  end

end
