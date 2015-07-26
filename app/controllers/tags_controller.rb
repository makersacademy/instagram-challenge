class TagsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def create
    tag_list = tag_params[:name].split(' ')
    image = Image.find(params[:image_id])
    tag_list.each do |tag|
      image.tags.create(name: tag)
    end
    redirect_to :back
  end

  def show
    @tag = Tag.find(params[:id])
    @images = @tag.images.order(likes: :desc)
  end

  def tag_params
    params.require(:tag).permit(:name)
  end

end
