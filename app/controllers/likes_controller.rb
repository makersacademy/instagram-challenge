class LikesController < ApplicationController
  # def index
  #   p "**&^%$£$%^&*&^%$£$%^&*(&^%$£$%^&*"
  #   p params
  #   p "**&^%$£$%^&*&^%$£$%^&*(&^%$£$%^&*"
  #   @like = Like.new

  # end
  def create
    p params
    @post = Post.find(params[:post_id])
    @like = @post.likes.create(post_id: params[:post_id], user_id: current_user.id)
    redirect_to request.referrer
  end

  # def create
  #   @article = Article.find(params[:article_id])
  #   @comment = @article.comments.create(comment_params)
  #   redirect_to article_path(@article)
  # end
 
  private
    def like_params
      params.require(:like).permit(:user_id, :post_id)
    end

end
