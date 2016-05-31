module CommentsHelper

	def check_comment_belongs_to_user
		comment = Comment.find(params[:id])
		unless comment.belongs_to?(current_user)
			flash[:alert] = "That comment isn't yours"
			redirect_to request.referer
		end
	end

end
