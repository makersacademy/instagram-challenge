class HamsController < ApplicationController
  def index
    @hams = Ham.all
  end

  def show
    @ham = Ham.find(params[:id])
  end

  def new
  end

  def create
    @ham = Ham.new(article_params)

    @ham.save
    redirect_to @ham
  end

  private
  def article_params
    params.require(:ham).permit(:title, :text)
  end
end
