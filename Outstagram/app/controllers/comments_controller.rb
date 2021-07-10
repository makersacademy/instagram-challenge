class CommentsController < ApplicationController
   before_action :set_post, only: [:show, :create, :destroy, :index]
 

  def create
  	@comment = @post.comments.create(comment_params)
  	@comment.user = current_user

  	respond_to do |format|
	  if @comment.save

	  else

	  end

	  format.html {redirect_to @post}
	end

  end

  private
  def set_post
  	@post = Post.find(params[:post_id])
  end

  def comment_params
  	params.require(:comment).permit(:text)
  end
end
