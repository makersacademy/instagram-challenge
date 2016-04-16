class MomentsController < ApplicationController
  def index
    @moments = Moment.all
  end

  def new
  end

  def create
    Moment.create(moment_params)
    redirect_to '/moments'
  end

  def moment_params
    params.require(:moment).permit(:description)
  end

end
