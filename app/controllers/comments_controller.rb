class CommentsController < ApplicationController
  before_action :authenticate_user!

	def new
		@photo = Photo.find(params[:photo_id])
		@comment = Comment.new
	end

	def update
		photo = Photo.find(params[:photo_id])
		photo.comments.build_with_user(comment_params, current_user)
		photo.comments.create(comment_params)
		redirect_to photos_path
	end

	def comment_params
		params.require(:comment).permit(:content).merge(user: current_user)
	end

  def destroy
    photo = Photo.find(params[:photo_id])
    comment = photo.comments.where(id: params[:id])
    if comment.first.user_id == current_user.id
      comment.first.destroy
      flash[:notice] = 'It\'s like it never even existed'
    else
      flash[:notice] = 'You can only delete your own comments'
    end
    redirect_to "/photos"
  end
end
