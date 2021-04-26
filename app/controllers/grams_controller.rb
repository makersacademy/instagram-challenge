class GramsController < ApplicationController
  def index
    @grams = Gram.all
  end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(gram_params)
    if @gram.save
      redirect_to root_url
    else
      render :new
    end
  end

  def like
    @gram = Gram.find(params[:gram_id])
    likes = @gram.likes
    likes.nil? ? likes = 1 : likes += 1
    @gram.update(likes: likes)
    redirect_to root_url
  end

  private

  def gram_params
    params.require(:gram).permit(:body, :image, :user_id, :likes)
  end
end
