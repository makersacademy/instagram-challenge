class HamsController < ApplicationController
  def index
    @hams = Ham.order("created_at desc").all
  end

  def show
    @ham = Ham.find(params[:id])
  end

  def new
  end

  def create
    @ham = Ham.new(article_params)

    @ham.save
    redirect_to hams_url
    # render plain: params[:ham].inspect
  end

  private
  def article_params
    params.require(:ham).permit(:title, :text)
  end
end
