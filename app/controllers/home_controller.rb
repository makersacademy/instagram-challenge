class HomeController < ApplicationController
  before_action :set_like, only: %i[ like ]

  def index
    @posts = Post.all
    @users = User.all
  end

  def like
    number = @like.likes + 1
    respond_to do |format|
      if @like.update(likes: number)
        format.html { redirect_to root_url, notice: "Like was successfully updated." }
      else
        format.html { redirect_to root_url, notice: "Like was unsuccessful." }
      end
    end
  end

  private

  def set_like
    @like = Post.find(params[:post_id])
  end

end
