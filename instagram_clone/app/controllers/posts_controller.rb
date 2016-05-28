class PostsController < ApplicationController

	include PostsHelper

	before_action :authenticate_user!, only: [:new,:create,:destroy,:edit,:update]
	before_action :check_post_belongs_to_user, only: [:destroy]

	def index
		@posts = Post.all
	end

	def show
		@post = Post.find(params[:id])
		@comment = Comment.new
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
		post.destroy
		redirect_to user_path(post.user)
	end

	def post_params
		params.require(:post).permit(:image, :caption)
	end

end
