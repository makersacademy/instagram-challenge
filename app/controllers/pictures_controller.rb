class PicturesController < ApplicationController
  def create
    @picture = current_user.pictures.build(picture_params)
    if @picture.save
      flash[:success] = "Picture created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def destroy
  end

  private

    def picture_params
      params.require(:picture).permit(:link)
    end
end