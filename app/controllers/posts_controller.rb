class PostsController < ApplicationController
  protect_from_forgery with: :null_session
  # before_action :authenticate_user!
  skip_before_action :verify_authenticity_token

  def index
    @post = Post.new
    @posts = Post.all
    @user = current_user
    p @user
  end

  def create
    p "IN THE CREATE METHOD, PARAMS ARE #{post_params}"
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
  end

  def posts_api
    posts = Post.joins(:user).order('created_at DESC')
    data = ActiveModel::Serializer::CollectionSerializer.new(posts, each_serializer: PostSerializer)
    respond_to do |format|
      format.html
      format.json { render json: data }
    end
  end

  def new_post_no_image_api
    @user = current_user
    @post = @user.posts.create(post_params)
    #
    # if @post.save
    #   render json: @post
    # else
    #   render error: { error: 'Unable to save post' }, status: 400
    # end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :image)
  end

  def new_post_params
    params.permit(:caption, :image, :post)
  end

end
