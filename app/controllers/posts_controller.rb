class PostsController < ApplicationController
  # before_action :authenticate_user!

  def index
    @post = Post.new
    @posts = Post.all
  end

  def create
    @user = current_user
    @post = @user.posts.create(post_params)

    redirect_to posts_url
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    # @post = Post.find(params[:id])
    @post.update(post_params)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to posts_url
  end

  def posts_api
    posts = Post.joins(:user).order('created_at DESC')
    data = ActiveModel::Serializer::CollectionSerializer.new(posts, each_serializer: PostSerializer)
    p "data is #{data}"
    respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :created_at, :image)
  end
end
