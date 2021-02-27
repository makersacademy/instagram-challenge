class InstaPostsController < ApplicationController
  before_action :set_insta_post, only: %i[ show edit update destroy ]

  # GET /insta_posts or /insta_posts.json
  def index
    @insta_posts = InstaPost.all
  end

  # GET /insta_posts/1 or /insta_posts/1.json
  def show
  end

  # GET /insta_posts/new
  def new
    @insta_post = InstaPost.new
  end

  # GET /insta_posts/1/edit
  def edit
  end

  # POST /insta_posts or /insta_posts.json
  def create
    @insta_post = InstaPost.new(insta_post_params)

    respond_to do |format|
      if @insta_post.save
        format.html { redirect_to @insta_post, notice: "Insta post was successfully created." }
        format.json { render :show, status: :created, location: @insta_post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @insta_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insta_posts/1 or /insta_posts/1.json
  def update
    respond_to do |format|
      if @insta_post.update(insta_post_params)
        format.html { redirect_to @insta_post, notice: "Insta post was successfully updated." }
        format.json { render :show, status: :ok, location: @insta_post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @insta_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insta_posts/1 or /insta_posts/1.json
  def destroy
    @insta_post.destroy
    respond_to do |format|
      format.html { redirect_to insta_posts_url, notice: "Insta post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_insta_post
      @insta_post = InstaPost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def insta_post_params
      params.require(:insta_post).permit(:name, :description, :picture)
    end
end
