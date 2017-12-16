class ReactionsController < ApplicationController
  def create
    Reaction.create(comment: params[:comment], like: params[:like], image_id: params[:image_id] )
    redirect_to '/'
  end
end
