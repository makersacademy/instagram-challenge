require 'net/scp'
class PostsController < ApplicationController
  # before_action :authenticate_user!
  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.create(post_params)
    redirect_to posts_path

    # upload our image to remote server
    #ENV["pusher_app_id"]
    file_path = "#{Dir.pwd}" + "/public" + "#{@post.moment.url(:medium).partition('?').first}"
    Net::SCP.upload!("18.188.174.95", "ubuntu",
    file_path, "/var/www/html",
    :ssh => { :password => ENV["password"] })

  end

  def destroy
    @post = current_user.posts.find(params[:id])
    @post.destroy
    flash[:success] = "Post Deleted"
    redirect_to posts_path
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(caption: params[:caption])
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:moment, :caption)
  end
end
