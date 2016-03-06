class LikesController < ApplicationController

  def create
    @post= Post.find(params[:param1])
    @like = @post.likes.create
    @like.user_id = current_user.id
    if @like.save
      redirect_to '/'
    else
      flash[:alert] = "Ops, something went wrong"
      redirect_to '/'
    end
  end

  def destroy
    @like = Like.find(params[:id])
    @like.destroy
    redirect_to '/'
  end

  private

  def user_owns_like?
    @like.user == current_user
  end

end
