module LikesHelper

	def check_if_user_has_already_liked
		post = Post.find(params[:post_id])
		if post.liked_by?(current_user)
			render json: { newCount: post.likes.count,
									 	 newLikeWord: ' like'.pluralize(post.likes.count),
									 	 likeError: 'You have already liked this post' }
		end
	end

	def check_if_user_is_signed_in
		post = Post.find(params[:post_id])
		if current_user.nil?
			render json: { newCount: post.likes.count,
									 	 newLikeWord: ' like'.pluralize(post.likes.count),
									 	 likeError: 'You must be logged in to like a post' }
		end
	end

end
