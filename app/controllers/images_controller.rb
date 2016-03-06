class ImagesController < ApplicationController
  
  before_action :authenticate_user! 
  
  def index
    @images = Image.all
  end
  
  def account 
    @images = Image.all.where(user_id: current_user.id)
  end
  
  def new
     @image = Image.new
     @comment = Comment.new
  end
  
  def create
    @user = User.find(current_user.id)
    @image = @user.images.create(image_params)
    @comment = @image.comments.create(thoughts: params[:image][:comment][:thoughts])
    redirect_to images_path
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    redirect_to account_images_path
  end
  
  def image_params
    params.require(:image).permit(:image, :title, :user_id)
  end
  
  #def comment_params
  #  params.require(:comment).permit(:thoughts, :image_id)
  #end
  
end
