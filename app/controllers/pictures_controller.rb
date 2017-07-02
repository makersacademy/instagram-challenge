class PicturesController < ApplicationController

  def show
    @pictures = []
    3.times { |number| @pictures << Picture.new({description: "My pic #{number}" }) }
    render :index
  end

  def new
    @picture = Picture.new
    render :new
  end

  def create
    saved_pic = Picture.create(picture_params).save
    puts "THIS IS THE SAVED PIC"
    puts saved_pic
    redirect_to action: "show"
  end

  private

  def picture_params
    params.require(:picture).permit(:description)
  end

end
