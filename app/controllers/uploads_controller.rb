class UploadsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @uploads = Upload.all
  end

  def new
    @upload = Upload.new
  end

  def create
    @upload = Upload.new(upload_params)
    @upload.user_id = current_user.id
    if @upload.save
      redirect_to uploads_path
    else
      render 'new'
    end
  end

  def show
    @upload = Upload.find(params[:id])
  end

  def upload_params
    params.require(:upload).permit(:description, :image)
  end

end
