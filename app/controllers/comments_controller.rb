class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy, :edit]
  before_action :authenticate_user!, :except => [:show]

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = current_user.id
    @post.save
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to post_path(@post), notice: 'Got dat deleted 4 u princess' }
      format.json { head :no_content }
    end
  end

  def update
    @comment = Comment.find(params[:id])
      respond_to do |format|
        if @comment.update(comment_params)
          format.html { redirect_to @post, notice: 'Sorted it 4 u hun' }
          format.json { render :show, status: :created, location: @comment }
        else
          format.html { render :edit }
          format.json { render json: @comment.errors, status: :unprocessable_entity }
        end
      end
    end

  private
    def comment_params
      params.require(:comment).permit(:body)
    end

    def set_post
      @post = Post.find(params[:post_id])
    end
end
