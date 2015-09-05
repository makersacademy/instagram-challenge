class CommentsController < ApplicationController

	# before_action :authenticate_user!, :except => [:index, :show]

	def new
	  @photo = Photo.find(params[:photo_id])
	  @comment = Comment.new
	end

	# def create
	#   @photo = Photo.find(params[:photo_id])
	#   @photo.comments.create(comment_params)

	#   redirect_to photos_path
	# end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.create(comment_params)
    if @comment.save
      redirect_to photos_path
    else
      render 'new'
    end
  end


	def comment_params
	  params.require(:comment).permit(:comment)
	end

end
