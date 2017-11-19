class CommentsController < ApplicationController
  def create
    @user = current_user.id
    @post = params[:post_id]
    @text = params[:text]

    Comment.create(post_id: params[:post_id], text: params[:comment][:text], user_id: current_user.id)
    redirect_to request.referrer
  end
  def show
  end

  def destroy
    @comment = Comment.find(params[:post_id])
    @comment.destroy
    redirect_to request.referrer
  end

  def edit
    @comment = Comment.find(params[:post_id])
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
    if @comment.update(text: params[:comment][:text])
      redirect_to @post
    else
      render 'edit'
    end
  end
end
