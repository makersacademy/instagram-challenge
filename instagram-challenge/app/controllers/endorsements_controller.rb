class EndorsementsController < ApplicationController

 def create
   @picture = Picture.find(params[:picture_id])
   like = @picture.endorsements.build
   like.user = current_user
   like.save
   render json: {new_endorsement_count: @picture.endorsements.count}
 end

end
