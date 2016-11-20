class ReactionsController < ApplicationController

  def new
    @reaction = Reaction.new
  end

  def create
    @reaction = Reaction.create(reaction_params)
    redirect_to '/photos'
  end


end
