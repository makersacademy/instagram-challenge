class LikesController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def new
    @photograph = Photograph.find(params[:photograph_id])
    @like = current_user.likes.new
    @photograph.likes << @like
    @like.save

    if @like.save
      redirect_to photographs_path
    else
      if @like.errors[:user]
        redirect_to photographs_path, alert: 'You have already liked this post'
      else
        render :new
      end
    end
  end

end
