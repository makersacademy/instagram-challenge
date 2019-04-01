class HamsController < ApplicationController
  def index
    @hams = Ham.order("created_at desc").all
  end

  def show
    @ham = Ham.find(params[:id])
  end

  def new
  end

  def create
    @ham = Ham.new(ham_params.merge(user_id: current_user.id))
    # @ham.username = current_user.username
    @ham.save
    redirect_to hams_url
    # render plain: params[:ham].inspect
    # "title"=>"asdf", "text"=>"sdfsdf"
  end

  private
  def ham_params
    params.require(:ham).permit(:title, :text, :image)
  end
end
