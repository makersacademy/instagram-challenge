class ImagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    user = User.find(params[:user_id])
    render json: { images: user.images }
  end

  def create
    p "HEREEEEEEEEE"
    p params
    # unless params[:file] == ""
      image = Image.new(picture: params[:file], user_id: params[:user_id])
      image.save
    # end
    redirect_to "/users/#{params[:user_id]}"
  end
end
