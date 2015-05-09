class LikesController < ApplicationController

  def new
    @post = Post.find(params[:post_id])
    create
  end

  def create
    @like = @post.likes.build_with_user(current_user)
    if @like.save
      redirect_to posts_path
    else
      render :new
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if current_user == @like.user
      @like.destroy
      flash[:notice] = 'Post has been unliked'
    else
      flash[:notice] = 'Cannot delete like'
    end
    redirect_to '/posts'
  end
end
