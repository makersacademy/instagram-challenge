class InstaPostsController < ApplicationController
  before_action :set_insta_post, only: %i[ show edit update destroy ]

  def index
    @insta_posts = InstaPost.all
    # InstaPost.all will retrieve all records from database 
    # The data is assigned to an instance variable @insta_posts
    # Index.html.erb (view) will iterate over @insta_posts and extract each entry in array []
    # The view will create the HTML output
    # The controller co-ordinates the whole process from obtaining data to then displaying 
  end

  def show
  end

  def new
    @insta_post = InstaPost.new
    # If a user goes to route localhost:3000/insta_posts/new to add a new post 
    # new.html.erb for view
    # new.html.erb will grab form HTML from _form.html.erb 
    # Rails will create an instance of InstaPostsController and call its new method (just initializes the process)

  end

  def edit
  end

  def create
    @insta_post = InstaPost.new(insta_post_params)
    # This tells your program what to do once you are actually creating the post (new just initializes the process)

    respond_to do |format|
      if @insta_post.save
        # http://localhost:3000/insta_posts/3
        # Each time a new post is created there will be a new route e.g.
        # http://localhost:3000/insta_posts/4
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
      # If user visits below route 
      # http://localhost:3000/insta_posts/5
      # The 5 at the end is the :id 
    end

    # Only allow a list of trusted parameters through.
    def insta_post_params
      params.require(:insta_post).permit(:name, :comment, :picture)
    end
end
