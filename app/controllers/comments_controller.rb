class CommentsController < ApplicationController
  include CommentsHelper
  before_action :authenticate_user!
  def create
    picture = Picture.find(params[:picture_id])
    comment = picture.comments.create_with_user(current_user, comment_params)
    render json: generate_json(picture.comments)
  end
end
