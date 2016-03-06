class CommentsController < ApplicationController

  def index
    @comments = Comment.order(:created_at)
  end

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.build_comment(comment_params, current_user)

    if @comment.save
      redirect_to root_path
    else
      if @review.errors[:user]
        redirect_to root_path, alert: 'Ops, Something went wrong'
      else
        render :new
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end


end
