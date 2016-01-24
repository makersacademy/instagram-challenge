class LikesBeforeCoolController < ApplicationController
  
  def create 
    @hipstergram = Hipstergram.find(params[:hipstergram_id])
    @hipstergram.likes_before_cool.create
    redirect_to hipstergrams_path
  end

end
