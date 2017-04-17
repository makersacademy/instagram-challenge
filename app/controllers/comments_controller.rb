class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]


  def index
    @comments = Comment.all
  end


  def show
  end


  def new
    @photo = Photo.find(params[:photo_id])
    puts params
    @comment = Comment.new
  end


  def edit
  end

  def create
    @photo = Photo.find(params[:photo_id])
    @comment = @photo.comments.build_with_user comment_params, current_user
    if @comment.save
      redirect_to photo_path(@photo)
    else
      render :new
    end
  end


  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @comment }
      else
        format.html { render :edit }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_comment
      @comment = Comment.find(params[:id])
    end


    def comment_params
      params.require(:comment).permit(:comment)
    end


end
