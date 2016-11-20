class PostsController < ApplicationController
  def index
  end

  def new
  end

  def create
    @post = Post.new(post_params) do |t|
      if params[:post][:image_data]
        t.image_data         = params[:post][:image_data].read
        t.image_name         = params[:post][:image_data].original_filename
        t.image_content_type = params[:post][:image_data].content_type
      end
    end
    @post.save
    redirect_to @post
  end

  def show
    @post = Post.find(params[:id])
    @description = @post[:description]
  end

  def show_image
    post = Post.find(params[:id])
    send_data(post.image_data,
              filename: post.image_name,
              type: post.image_content_type,
              disposition: "inline")
  end

  private

  def post_params
    params.require(:post).permit(:image_data, :description)
  end


end
