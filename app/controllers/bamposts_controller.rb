class BampostsController < ApplicationController
  before_action :set_bampost, only: %i[ show edit update destroy ]

  # GET /bamposts or /bamposts.json
  def index
    @bamposts = Bampost.all
  end

  # GET /bamposts/1 or /bamposts/1.json
  def show
  end

  # GET /bamposts/new
  def new
    @bampost = Bampost.new
  end

  # GET /bamposts/1/edit
  def edit
  end

  # POST /bamposts or /bamposts.json
  def create
    @bampost = Bampost.new(bampost_params)

    respond_to do |format|
      if @bampost.save
        format.html { redirect_to @bampost, notice: "Bampost was successfully created." }
        format.json { render :show, status: :created, location: @bampost }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @bampost.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bamposts/1 or /bamposts/1.json
  def update
    respond_to do |format|
      if @bampost.update(bampost_params)
        format.html { redirect_to @bampost, notice: "Bampost was successfully updated." }
        format.json { render :show, status: :ok, location: @bampost }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @bampost.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bamposts/1 or /bamposts/1.json
  def destroy
    @bampost.destroy
    respond_to do |format|
      format.html { redirect_to bamposts_url, notice: "Bampost was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bampost
      @bampost = Bampost.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def bampost_params
      params.require(:bampost).permit(:content, :user_id)
    end
end
