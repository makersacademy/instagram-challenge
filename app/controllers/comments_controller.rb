class CommentsController < ApplicationController
  def create
    Comment.create comment_params
    redirect_back fallback_location: root_path
  end

  def destroy
    Comment.destroy params[:id]
    redirect_back fallback_location: root_path
  end

  private

  def comment_params
    {
      body: params[:body],
      user_id: session[:id],
      post_id: params[:post_id]
    }
  end
end
