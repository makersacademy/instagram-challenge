class PostsController < ApplicationController
  before_action :require_user_logged_in!

  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
    set_post
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
    check_user_is_author
  end

  # POST /posts or /posts.json
  def create
    @post = Post.create(post_params.merge(user_id: Current.user.id))
    if @post.save
      redirect_to posts_url
    else
      flash[:notice] = "Post could not be submitted."
      render :new
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    check_user_is_author
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    check_user_is_author
    # for some reason it doesn't redirect here when post is nil
    @post.destroy if @post
  end

  private
  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:image, :caption)
  end

  # just in case
  def check_user_is_author
    @post = Current.user.posts.find_by(id: params[:id])
    redirect_back(fallback_location:"/") unless @post
  end
end
