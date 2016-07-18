class EndorsementsController < ApplicationController

	def create
		@post = Post.find(params[:post_id])
		@endorsement = Endorsement.create
		@post.endorsements << @endorsement
		redirect_to '/'
	end

end
