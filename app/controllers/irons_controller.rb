class IronsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @iron = @post.irons.build_with_user({}, current_user)
    @iron.save
    redirect_to posts_path
  end

  def destroy
    @iron = Iron.find(params[:id])
    @iron.destroy_if_created_by?(current_user)
    redirect_to posts_path
  end

end
