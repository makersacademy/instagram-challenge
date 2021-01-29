class Post::CommentsController < ApplicationController
  before_action :set_post_comment, only: %i[ show edit update destroy ]

  # GET /post/comments or /post/comments.json
  def index
    @post_comments = Post::Comment.all
  end

  # GET /post/comments/1 or /post/comments/1.json
  def show
  end

  # GET /post/comments/new
  def new
    @post_comment = Post::Comment.new
  end

  # GET /post/comments/1/edit
  def edit
  end

  # POST /post/comments or /post/comments.json
  def create
    @post_comment = Post::Comment.new(post_comment_params)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post_comment, notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @post_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post/comments/1 or /post/comments/1.json
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment, notice: "Comment was successfully updated." }
        format.json { render :show, status: :ok, location: @post_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post/comments/1 or /post/comments/1.json
  def destroy
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_url, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = Post::Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_comment_params
      params.require(:post_comment).permit(:comments, :post_id, :user_id)
    end
end
