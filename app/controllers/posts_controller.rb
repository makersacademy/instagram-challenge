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
    timestamp = DateTime.now.strftime('%Y%m%d%H%M%S')
    filename = "#{timestamp}-#{uploaded_image.original_filename}" 
    file = File.open(Rails.root.join('public', 'posts', "#{filename}"), 'wb') do |file|
      file.write(uploaded_image.read)
    end
    if file
      @post = current_user.posts.create(image_url: "posts/#{filename}")
    end

    redirect_to posts_url
  end

end
