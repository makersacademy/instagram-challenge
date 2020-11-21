class PostController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
  end

  def create
    @post = Post.create!(caption: params[:caption], user_id: current_user.id, image: params[:image])
    if @post.image.attached?
      redirect_to root_path, notice: "Your image was uploaded successfully!"
    else
      redirect_to root_path, alert: "Something went wrong with your image upload"
    end
  end

  private

  def post_params
    params.permit(:caption, :user_id, :image)
  end

end
