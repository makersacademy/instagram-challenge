class IronsController < ApplicationController

  def new
    create
  end

  def create
    @post = Post.find(params[:post_id])
    @iron = @post.irons.build_with_user({}, current_user)
    flash[:alert] = "you have ironed this post already" unless @iron.save
    redirect_to posts_path
  end

end
