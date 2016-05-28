module LikesHelper

	def check_if_user_has_already_liked
		post = Post.find(params[:post_id])
		if post.liked_by?(current_user)
			flash[:alert] = 'You have already liked that post'
			redirect_to posts_path
		end
	end

end
