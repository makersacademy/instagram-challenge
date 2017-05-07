class CommentsController < ApplicationController
  def new
    @scene = Scene.find(params[:scene_id])
    @comment = Comment.new
  end

  def create
    @scene = Scene.find(params[:scene_id])
    @comment = @scene.comments.create(comment_params)

    # if @comment.save
      redirect_to scenes_path
    # end
  end

  private

  def comment_params
    params.required(:comment).permit(:thoughts)
  end
end
