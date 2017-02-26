class CommentsController < ApplicationController
  before_action :set_post

  def create
      # set_post
      @comment = @post.comments.build(comment_params)
      @comment.user_id = current_user.id
      # setting the user id of the comment to whoever is logged in

      if @comment.save
        redirect_to :back
      else
        render root_path
      end
  end

  def destroy
    # set_post
    @comment = @post.comments.find(params[:id])
    # find whichever comment matches the params.id on this particular post

    @comment.destroy
    # destrooooy!
    p 'comment deleted'
    redirect_to root_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
  # is there a point to this little comment params method? why not just params
  # inside the create method?

  def set_post
    @post = Post.find(params[:post_id])
  end

end
