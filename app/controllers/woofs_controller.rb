class WoofsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.woofs.create
    render json: {new_endorsement_count: @review.endorsements.count}
   end
  end
