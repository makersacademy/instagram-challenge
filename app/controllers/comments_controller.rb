class CommentsController < ApplicationController
	before_action :authenticate_user!

	def new
	  @picture = Picture.find(params[:picture_id])
	  @comment = Comment.new
	  # @comment = @picture.comments.build
	end

	def create
	  @picture = Picture.find(params[:picture_id])
	  @comment = Comment.new(comment_params)
	  @comment.author = current_user.email
	  @comment.user_id = current_user.id
	  @picture.comments << @comment

	  if @comment.save
	  	redirect_to picture_path(@picture)
	  else
	  	flash.now[:notice] = "Field cannot be blank"
      render 'new'
    end
	end

	private

	def comment_params
	  params.require(:comment).permit(:content)
	end

end
