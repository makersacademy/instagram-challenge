class GramsController < ApplicationController

  def index
  end

  def new
    @gram = Gram.new
  end

  def create
    if current_user
      @gram = current_user.grams.new(gram_params)
      if @gram.save
        flash[:notice] = "YOU GRAMMED"
        redirect_to @gram
      else
        render 'new'
      end
    else
      flash[:alert] = "You must be signed in"
      redirect_to "#index"
    end
  end

  def show
    @gram = Gram.find(params[:id])
  end

  private

    def gram_params
      params.require(:gram).permit(:title, :image)
    end
end
