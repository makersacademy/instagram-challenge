class ReactionsController < ApplicationController

  def new
    @photo = Photo.find(params[:photo_id])
    @reaction = Reaction.new
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @reaction = @photo.reactions.create(reaction_params)
    redirect_to '/photos'
  end

  def reaction_params
    params.require(:reaction).permit(:like, :love, :indifference)
  end


end
