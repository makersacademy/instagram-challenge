require 'rails_helper'

RSpec.describe CommentsController, type: :controller do
  def new
    @picture = Picture.find(params[:picture_id])
    @comment = Comment.new
  end

  def create
    @picture = Picture.find(params[:picture_id])
    @picture.comments.create(comment_params)
  end
end
