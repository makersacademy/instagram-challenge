module CommentsHelper

  def find_post_and_build_with_user
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params, current_user)
  end

  def try_save_comment_and_flash
    if @comment.save
      flash[:notice] = 'Comment successfully created'
    else
      flash[:alert] = 'Your comment was not saved'
    end
  end
  
end
