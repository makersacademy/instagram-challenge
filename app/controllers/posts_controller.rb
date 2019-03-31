class PostsController < ApplicationController

  before_action :authenticate_user!

  def index
    @posts = Post.order('created_at desc').all
  end

  def new
    @post = Post.new
  end

  def create
    uploaded_image = params[:post][:image]
    filename = "#{DateTime.now.strftime('%Y%m%d%H%M%S')}-#{uploaded_image.original_filename}" 
    uploaded_file = File.open(Rails.root.join('public', 'posts', "#{filename}"), 'wb') do |file|
      file.write(uploaded_image.read)
    end

    current_user.posts.create(image_url: "posts/#{filename}") if uploaded_file

    redirect_to posts_url
  end

  def destroy
    post = Post.find(params[:id])
    post.likes.destroy_all
    post.destroy
    redirect_to '/posts'
    File.open(Rails.root.join('public', "#{post.image_url}"), 'r') do |f|
      File.delete(f)
    end
  end

  def show
    @post = Post.find(params[:id])
  end

end
