class PostsController < ApplicationController

	before_action :authenticate_user!, only: [:new,:create,:destroy,:edit,:update]

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		post = current_user.posts.new(post_params)
		if post.save
			redirect_to posts_path
		else
			flash[:alert] = post.errors
			redirect_to new_post_path
		end
	end

	def destroy
		post = Post.find(params[:id])
		post.action_if_creator(user: current_user,method: __method__.to_s)

		redirect_to "/users/#{post.user.id}"
	end

	def post_params
		params.require(:post).permit(:image, :caption)
	end

end
