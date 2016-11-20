class CommentsController < ApplicationController

  before_action :authenticate_user!

  def new
   @picture = Picture.find(params[:picture_id])
   @comment = Comment.new
  end

  def create
   @picture = Picture.find(params[:picture_id])
   @comment = @picture.comments.build(comment_params)
   @comment.user = current_user
   p @comment
   if @comment.save
     redirect_to('/')
   else
     flash[:notice] = 'There was a problem posting your comment'
     redirect_to('/')
   end
  end

  private

 def comment_params
   params.require(:comment).permit(:comment)
 end

end
