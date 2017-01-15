class LikesController < ApplicationController

  def new
    @photograph = Photograph.find(params[:photograph_id])
    @photograph.likes.create
    redirect_to photographs_path
  end

end
