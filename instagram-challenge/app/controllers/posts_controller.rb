class PostsController < ApplicationController
	def index
	end

	def new
	end

	def create
		Post.create(post_params)
		redirect_to '/posts'
	end

	def post_params
		params.require(:post).permit(:caption, :image)
	end
end
