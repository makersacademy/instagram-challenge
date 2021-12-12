class CommentsController < ApplicationController 

  def create
    @comment = Comment.new(comment_params)
    @comment.account_id = current_account.id if account_signed_in?
    # @comment.post_id = current_post.id

    if @comment.save
      redirect_to :dashboard, flash: {success: "Comment was created successfully"}
    else
      redirect_to :dashboard, flash: {danger: "Comment was not created successfully"}

    end

  end


  private
  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

end
