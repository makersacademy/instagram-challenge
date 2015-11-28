class CommentsController < ApplicationController

	def new
	  @picture = Picture.find(params[:picture_id])
	  @comment = Comment.new
	end

	def create
    Comment.create(comment_params)
    redirect_to '/pictures'
  end

  def comment_params
  	params.require(:comment).permit(:comment)
	end

end
