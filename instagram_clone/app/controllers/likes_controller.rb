class LikesController < ApplicationController

	include LikesHelper

	before_action :check_if_user_is_signed_in, only: [:create]
	before_action :check_if_user_has_already_liked, only: [:create]

	def create
		post = Post.find(params[:post_id])
		post.likes.create_with_user(current_user)
		render json: { newCount: post.likes.count,
									 newLikeWord: ' like'.pluralize(post.likes.count) }
	end

end
