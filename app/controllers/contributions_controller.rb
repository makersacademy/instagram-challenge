class ContributionsController < ApplicationController

  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @all_contributions = Contribution.all
  end

  def new
    @contribution = Contribution.new
  end

  def create
    @user = current_user
    contribution = Contribution.create(contribution_params)
    contribution.user_id = @user.id
    contribution.save
    redirect_to '/contributions'
  end

  def show
    @contribution = Contribution.find(params[:id])
  end

  def edit
    @contribution = Contribution.find(params[:id])
  end

  def update
    @contribution = Contribution.find(params[:id])
    @contribution.update(contribution_params)
    redirect_to '/contributions'
  end

  def destroy
    @contribution = Contribution.find(params[:id])
    @contribution.destroy
    flash[:notice] = 'Deleted'
    redirect_to '/contributions'
  end

  def contribution_params
    params.require(:contribution).permit(:image, :comment)
  end

end
