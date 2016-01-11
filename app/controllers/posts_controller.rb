class PostsController < ApplicationController

	before_action :post_creator?, :only => [:edit, :update, :destroy]
	before_action :authenticate_user!, :except => [:index, :show]

	def index 
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		@post.user_id = current_user.id
		if @post.save
			redirect_to posts_path
		else
			render 'new'
		end
	end

	def show
		@post = Post.find(params[:id])
	end
	
	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		@post.update(post_params)

		redirect_to '/posts'
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		flash[:notice] = 'Post deleted successfully'
		redirect_to '/posts'
	end

	def post_creator?
	 	@post = Post.find(params[:id])
	  unless current_user.id == @post.user_id
	    flash[:notice] = "You didn't post this"
	    redirect_to posts_path
	  end
  end

	private 

		def post_params
			params.require(:post).permit(:name, :image)
		end
end


 
