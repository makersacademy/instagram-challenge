class CommentsController < ApplicationController
  def create
    Photo.find(params["photo_id"]).comments.create(comment_params)
    redirect_to('/photos')
  end

  def comment_params
    combined_params = params.require(:comment).permit(:content)
    combined_params['user_id'] = current_user.id
    combined_params
  end
end
