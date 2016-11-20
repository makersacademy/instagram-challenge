class PostsController < ApplicationController
  def index
    @posts = Post.order(:created_at).reverse_order.first(10)
  end

  def create
    @post = Post.new(post_params) do |t|
      if params[:post][:image_data]
        t.image_data         = params[:post][:image_data].read
        t.image_name         = params[:post][:image_data].original_filename
        t.image_content_type = params[:post][:image_data].content_type
      end
    end
    if @post.save
      redirect_to @post
    else
      render 'new'
    end
  end

  def new
    @post = Post.new
  end

  def edit
    @post = Post.find(params[:id])
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

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to @post
    else
      render 'edit'
    end
  end

  private

  def post_params
    params.require(:post).permit(:image_data, :description, :image_content_type, :image_name)
  end


end
