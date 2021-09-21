class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]

  # GET /posts or /posts.json
  def index
    redirect_to login_path unless session[:user_id]
    @friend = Friend.new
    @like = Like.new
    @follow_this_list = []
    @friends = Friend.where({ user_id: session[:user_id].to_i })
    if params[:noneusername]
      only_this_user = User.where(username: params[:noneusername]).first
      @follow_this_list.push(only_this_user.id.to_i) if only_this_user
    else
      @friends.each { |friend| @follow_this_list.push(friend.follow.to_i) }
      @follow_this_list.push(session[:user_id].to_i)
    end
    @friends = @friends.map { |friend| User.find(friend.follow.to_i) }
    @friends_already = @friends.map { |friend| friend.id.to_i }
    @posts = Post.where(user_id: @follow_this_list).reverse
    @users = User.where.not(id: @friends_already.push(session[:user_id].to_i))
  end

  def show
    redirect_to home_path
  end

  def new
    redirect_to login_path unless session[:user_id]

    @post = Post.new
  end

  # GET /posts/1/edit
  def edit; end

  # POST /posts or /posts.json
  def create
    redirect_to login_path unless session[:user_id]
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
    redirect_to home_path
    # message = 'Post was successfully updated.'
    # redirect_to login_path unless session[:user_id]
    # respond_to do |format|
    #   if @post.update(post_params)
    #     format.html { redirect_to @post, notice: message }
    #     format.json { render :show, status: :ok, location: @post }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @post.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def destroy
    redirect_to home_path
    # message = 'Post was successfully destroyed.'
    # if (!session[:user_id] || params[:id].to_s != session[:user_id].to_s)
    #   redirect_to home_path
    # else
    #   @post.destroy
    #   respond_to do |format|
    #     format.html { redirect_to posts_url, notice: message }
    #     format.json { head :no_content }
    #   end
    # end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    redirect_to login_path unless session[:user_id]

    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    if session[:user_id]
      params[:post][:user_id] = session[:user_id]
    else
      params[:post][:user_id] = nil
    end
    params.require(:post).permit(:entry, :avatar, :user_id)
  end
end
