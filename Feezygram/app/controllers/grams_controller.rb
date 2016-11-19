class GramsController < ApplicationController

  def index
    @grams = Gram.all
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

  def edit
    @gram = Gram.find(params[:id])
  end

  def update
    @gram = Gram.find(params[:id])
    @gram.update_attribute(:image, params[:gram][:image])
    if current_user && current_user == @gram.user
      if @gram.save
      flash[:notice] = "You updated this gram!"
      redirect_to @gram
      else
        render 'edit'
      end
    else
      flash[:alert] = "That doesn't belong to you!"
      redirect_to "#index"
    end
  end

  def show
    @gram = Gram.find(params[:id])
    @comment = Comment.new
  end

  private

    def gram_params
      params.require(:gram).permit(:title, :image)
    end
end
