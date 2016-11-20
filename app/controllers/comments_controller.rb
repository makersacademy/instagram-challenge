class CommentsController < ApplicationController

  before_action :find_commentable

  def new
    if (params[:photo_id])
      @photo = Photo.find(params[:photo_id])
      @comment = @commentable.comments.new

    else
      @comment = @commentable.comments.new
      # @photo = Photo.new
      # @photo.find()
    end
  end

  def create
    # @photo = Photo.find(params[:photo_id])
    # puts @photo
    @comment = @commentable.comments.create(comment_params)

    redirect_to '/photos'


  end

  def show
    @photo = Photo.find(params[:id])
    @comments = @photo.comments
    puts @comments
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

  def find_commentable
    @commentable = Comment.find(params[:comment_id]) if params[:comment_id]
    @commentable = Photo.find(params[:photo_id]) if params[:photo_id]
    puts @commentable
    puts "at least this bit has worked"
  end

end
