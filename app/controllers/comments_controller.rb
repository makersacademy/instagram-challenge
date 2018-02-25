class CommentsController < ApplicationController
  before_action :set_post, only: [:create, :destroy, :edit]

  def create
    @comment = @post.comments.create(comment_params)
    redirect_to post_path(@post)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
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
