class CommentsController < ApplicationController

def new 
  # p 'hello'
  @comment = Comment.new
  @post = Post.find(params[:post_id])

end 

def create
  # p params
  @comment = Comment.new(comment_from_params)
  @comment.user_id = current_user.id
  @comment.post_id = params[:post_id]
  if @comment.save
    flash[:success] = 'comment saved'
    redirect_to post_path(@comment.post)
  else 
    render :new, error: 'comment not posted'
  end 
end 

private 
  def comment_from_params
    params.require(:comment).permit(:body)
  end 




end
