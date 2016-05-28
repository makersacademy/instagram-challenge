class LikesController < ApplicationController

	include LikesHelper

	before_action :authenticate_user!, only: [:create]
	before_action :check_if_user_has_already_liked, only: [:create]

	def create
		post = Post.find(params[:post_id])
		post.likes.create_with_user(current_user)
		redirect_to posts_path
	end

end
