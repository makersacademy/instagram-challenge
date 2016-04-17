class MomentsController < ApplicationController
before_action :authenticate_user!, :except => [:index, :show]

  def index
    @moments = Moment.all
  end

  def new
    @moment = Moment.new
  end

  def create
    @moment = Moment.create(moment_params)
    redirect_to '/moments'
  end

  def moment_params
    params.require(:moment).permit(:description, :image)
  end

  def destroy
    @moment = Moment.find(params[:id])
    @moment.destroy
    flash[:notice] = "Moment deleted"
    redirect_to '/moments'
  end

  def show
    @moment = Moment.find(params[:id])
    @comment = @moment.comments.new
  end

end
