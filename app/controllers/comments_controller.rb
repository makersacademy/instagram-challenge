class CommentsController < ApplicationController

  respond_to :html, :js

  def create
    post = Post.find(params[:post_id])
    post.comments.build(comment_params.merge(user_id: current_user.id))
    post.save
    if request.xhr?
      render json: { id: params[:post_id] }
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
