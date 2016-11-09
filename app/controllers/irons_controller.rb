class IronsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @iron = @post.irons.build_with_user({}, current_user)
    flash[:alert] = "You have ironed this post already" unless @iron.save
    if request.xhr?
      render json: {new_irons_count: @post.irons.count}
    else
      redirect_to posts_path
    end
  end

end
