module PostsHelper

	def check_post_belongs_to_user
		post = Post.find(params[:id])
		unless post.belongs_to?(current_user)
			flash[:alert] = "That post isn't yours"
			redirect_to user_path(post.user)
		end
	end

end
