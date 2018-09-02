class InstapostsController < ApplicationController
  before_action :set_instapost, only: [:show, :edit, :update, :destroy]

  # GET /instaposts
  # GET /instaposts.json
  def index
    @instaposts = Instapost.all
  end

  # GET /instaposts/1
  # GET /instaposts/1.json
  def show
    @comments = @instapost.comments.all
    @comment = @instapost.comments.build
  end

  # GET /instaposts/new
  def new
    @instapost = Instapost.new
  end

  # GET /instaposts/1/edit
  def edit
  end

  # POST /instaposts
  # POST /instaposts.json
  def create
    @instapost = Instapost.new(instapost_params)

    respond_to do |format|
      if @instapost.save
        format.html { redirect_to @instapost, notice: 'Instapost was successfully created.' }
        format.json { render :show, status: :created, location: @instapost }
      else
        format.html { render :new }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /instaposts/1
  # PATCH/PUT /instaposts/1.json
  def update
    respond_to do |format|
      if @instapost.update(instapost_params)
        format.html { redirect_to @instapost, notice: 'Instapost was successfully updated.' }
        format.json { render :show, status: :ok, location: @instapost }
      else
        format.html { render :edit }
        format.json { render json: @instapost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /instaposts/1
  # DELETE /instaposts/1.json
  def destroy
    @instapost.destroy
    respond_to do |format|
      format.html { redirect_to instaposts_url, notice: 'Instapost was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote 
    :verify_authenticity_token
    @instapost = Instapost.find(params[:id])
    @instapost.upvote_by current_user
    redirect_back(fallback_location: root_path)
  end  
  
  def downvote
    :verify_authenticity_token
    @instapost = Instapost.find(params[:id])
    @instapost.downvote_by current_user
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_instapost
      @instapost = Instapost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def instapost_params
      params.require(:instapost).permit(:name, :description, :picture)
    end
end
