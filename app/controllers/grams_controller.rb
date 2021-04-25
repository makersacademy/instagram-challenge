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

  private

  def gram_params
    params.require(:gram).permit(:body, :image, :user_id)
  end
end
