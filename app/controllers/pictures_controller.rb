class PicturesController < ApplicationController
  before_action :find_pic, only: [:show, :edit, :update, :destroy]
  
  def index
    @pictures = Picture.all.order("created_at DESC")
  end 
  
  def show 
  end

  #associated with the view file new.html.haml
  def new
    #so that pictures are being build from the current user 
    @picture = current_user.pictures.build
 end 

  #no view file - responsible for creating the component of a picture in the db
  def create
    @picture = current_user.pictures.build(pic_params)

    if @picture.save
        redirect_to @picture, notice: "Yes pic posted!"
    else
      render 'new'
    end
  end 

  def edit 
  end 

#deals with changes to the db
 def update 
  if @picture.update(pic_params)
    redirect_to @picture, notice: "Pic has been updated"
  else
    render 'edit'
  end 
 end 

 def destroy 
  @picture.destroy
  redirect_to root_path
 end

  private 
  def pic_params
    params.require(:picture).permit(:title, :description, :image)
  end

  #this allows us to not define show/edit
  def find_pic
    @picture = Picture.find(params[:id])
  end

end
