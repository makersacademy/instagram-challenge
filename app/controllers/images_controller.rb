class ImagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.order(likes: :desc)
  end

  def new
    @image = Image.new
  end

  def create
    @image = current_user.images.new(image_params)
    if @image.save
      redirect_to images_path
    else
      flash[:notice] = @image.errors.full_messages.join(', ')
      redirect_to new_image_path
    end
  end

  def show
    @image = Image.find(params[:id])
    creator = User.find(@image.user_id)
    @creator_handle = creator.username
    @likes = @image.likes
    comments = Comment.where("image_id = #{params[:id]}")
    @comments_info = comments.map { |comment| User.find(comment.user_id).username + ' says: ' + comment.content }
  end

  def update
    image = Image.find(params[:id])
    new_likes = image.likes + 1
    image.update_column('likes',  new_likes)
    redirect_to :back
  end

  def image_params
    params.require(:image).permit(:description, :picture)
  end

end
