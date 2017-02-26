class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_article, only: [:new, :create, :show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def new
    @comment = Comment.new
  end

  def create
    @comment = @article.comments.create(article_params.merge(user_id: current_user.id))
    respond_to do |format|
      if @comment.save
        format.html { redirect_to @article, notice: 'Comment was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    def set_article
      @article = Article.find(params[:article_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def article_params
      params.require(:comment).permit(:body)
    end
end
