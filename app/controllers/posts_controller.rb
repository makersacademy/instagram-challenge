class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
		@post = Post.new
	end

	def create
		@post = Post.create(post_params)
		# respond_to do |format|
		# 	if @post.save
		# 		format.html { redirect_to @post, notice: 'Post was successfully created.' }
		# 		format.json { render :show, status: :created, location: @post }
		# 	else
		# 		format.html { render :new }
		# 		format.json { render json: @post.errors, status: :unprocessable_entity }
		# 	end
		# end
		redirect_to '/posts'
	end

	def show
		@post = Post.find(params[:id])
	end

 private
	def post_params
	params.require(:post).permit(:description, :image)
	end

end
