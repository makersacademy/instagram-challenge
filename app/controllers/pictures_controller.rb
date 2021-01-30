class PicturesController < ApplicationController
  def index
    @pictures = Picture.all.order("created_at DESC")
  end

  def show
    @picture = Picture.find(params[:id])
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(article_params)

    if @picture.save
      redirect_to :index
    else
      render :new
    end
  end

  private
    def article_params
      params.require(:article).permit(:title, :body)
    end
end
