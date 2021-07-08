class PostsController < ApplicationController
	before_action :authenticate_user!
	
  def index
		@posts = Post.all
  end

	def new
		@post = Post.new
	end

	def create
    post = Post.new(post_params)
    current_user.posts << post
    current_user.save
    redirect_to posts_url
  end

	private

 	def post_params
 		params.require(:post).permit(:caption, :image)
 	end

end
