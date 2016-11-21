class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]

  # POST /comments
  def create
    @comment = Comment.new(comment_params)
    @comment.pic_id = params[:pic_id]

    respond_to do |format|
      if @comment.save
        format.html { redirect_to "/pics/#{params['pic_id']}", notice: 'Comment posted.' }
      else
        format.html { redirect_to "/pics/#{params['pic_id']}", flash: { :error => "Comment wasn't posted." } }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
      else
        format.html { redirect_to @comment, flash: {error: 'Comment was successfully updated.'} }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url, notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:thoughts, :pic_id)
    end
end
