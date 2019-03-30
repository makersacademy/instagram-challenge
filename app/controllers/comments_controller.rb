class CommentsController < ApplicationController

  # GET /likes/new
  def new
    @comment = Comment.new
    @post = Post.find(params[:post_id])
    @like = Like.new
  end

  # POST /likes
  # POST /likes.json
  def create
    @comment = Comment.new(comment_params)
    @post = Post.find(@comment.post_id)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @post, notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def comment_params
      params.require(:comment).permit(:post_id, :name, :content)
    end
end
