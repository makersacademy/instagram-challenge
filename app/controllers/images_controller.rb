class ImagesController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @images = Image.all
  end

  def new
    @image = Image.new
  end

  def create
    current_user.images.create(image_params)
    redirect_to images_path
  end

  def show
    @image = Image.find(params[:id])
    creator = User.find(@image.user_id)
    @creator_handle = make_handle(creator)
    @likes = @image.likes
    comments = Comment.where("image_id = #{params[:id]}")
    @comments_info = comments.map { |comment| make_handle(User.find(comment.user_id)) + ' says: ' + comment.content }
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

  def make_handle obj
    obj.email.split('@').first
  end


end
