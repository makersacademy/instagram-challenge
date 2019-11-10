class PicsController < ApplicationController
  before_action :find_pic, only: [:edit, :destroy, :show, :update, :upvote, :downvote]

  def new
    @pic = Pic.new
  end

  def create
    p user_signed_in?
    p current_user
    p current_user.id
    @pic = Pic.create(pic_params.merge(user_id: current_user.id))
    redirect_to pics_url
  end

  def index
    @pics = Pic.all.order("created_at DESC")
  end

  def show
  end

  def edit
  end

  def update
    if @pic.update(pic_params)
      redirect_to pics_url
    else
      render 'edit'
    end
  end

  def destroy
    @pic.destroy
    redirect_to pic_url
  end

  def upvote
    
  end

  def downvote
    
  end

  private
    def pic_params
      params.require(:pic).permit(:title, :description, :image)
    end

    def find_pic
      @pic = Pic.find(params[:id])
    end
end
