class CommentsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]
  before_action :set_comments
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :comment_owner, only: [:edit, :update, :destroy]

def comment_owner
  unless @comment.user_id == current_user.id
    flash[:notice] = 'Access denied as you are not owner of this Comment'
    redirect_to pictures_path
  end
end

  # GET pictures/1/comments
  def index
    @comments = @picture.comments
  end

  # GET pictures/1/comments/1
  def show
  end

  # GET pictures/1/comments/new
  def new
    @comment = @picture.comments.build
  end

  # GET pictures/1/comments/1/edit
  def edit
  end

  # POST pictures/1/comments
  def create
    @comment = @picture.comments.build(comment_params)

    if @comment.save
      redirect_to(picture_path(@picture.id), notice: 'Comment was successfully created.')
    else
      render action: 'new'
    end
  end

  # PUT pictures/1/comments/1
  def update
    if @comment.update_attributes(comment_params)
      redirect_to(picture_path(@picture.id), notice: 'Comment was successfully updated.')
    else
      render action: 'edit'
    end
  end

  # DELETE pictures/1/comments/1
  def destroy
    @comment.destroy

    redirect_to(picture_path(@picture.id), notice: 'Comment was successfully deleted.')
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comments
      @picture = Picture.find(params[:picture_id])
    end

    def set_comment
      @comment = @picture.comments.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def comment_params
      params.require(:comment).permit(:name, :comment, :user_id)
    end
end
