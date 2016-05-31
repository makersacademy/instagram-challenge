class EndorsementsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.endorsements.create
    render json: {new_endorsement_count: @post.endorsements.count}
  end
end
