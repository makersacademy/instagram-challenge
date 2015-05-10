class CommentsController < ApplicationController

  def new
    @photo = Photo.find params[:photo_id]
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(create_comment_from_params)
    redirect_to '/'
  end

  def create_comment_from_params
    params.require('comment').permit('text').merge(photo_id: params['photo_id'])
  end

end
