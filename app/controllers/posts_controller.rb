class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    redirect_to login_path unless session[:user_id]
    @friend = Friend.new
    @friends =
      Friend
        .where({ user_id: session[:user_id].to_i })
        .map { |friend| User.find(friend.follow.to_i) }
    @like = Like.new
    @posts = Post.all
    @users = User.where('id != ' << session[:user_id].to_s)
  end

  # GET /posts/1 or /posts/1.json
  def show; end

  # GET /posts/new
  def new
    redirect_to login_path unless session[:user_id]

    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    message = 'Post was successfully created.'
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: message }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    message = 'Post was successfully updated.'
    redirect_to login_path unless session[:user_id]
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: message }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    message = 'Post was successfully destroyed.'
    redirect_to login_path unless session[:user_id]
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: message }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    redirect_to login_path unless session[:user_id]

    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:entry, :avatar, :user_id)
  end
end
