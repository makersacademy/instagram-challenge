class CommentsController < ApplicationController

before_action :authenticate_user!, :except => [:index, :show]

  def new
    @post = Post.find(params[:post_id])
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build_with_user(comment_params, current_user)
    if @comment.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def comment_params
    params.require(:comment).permit(:comments)
  end


end
