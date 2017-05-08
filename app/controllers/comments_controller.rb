class CommentsController < ApplicationController
  def new
    @scene = Scene.find(params[:scene_id])
    @comment = Comment.new
  end

  def create
    @scene = Scene.find(params[:scene_id])
    @comment = @scene.comments.create(comment_params)

    redirect_to "/scenes/#{params[:scene_id]}"
  end

  private

  def comment_params
    params.required(:comment).permit(:thoughts)
  end
end
