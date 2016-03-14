class LikesBeforeCoolController < ApplicationController
  
  def create  
    @hipstergram = Hipstergram.find(params[:hipstergram_id])
    @hipstergram.like_before_cools.create
    render json: {new_likes_before_cool_count: @hipstergram.like_before_cools.count}
  end

 

end
