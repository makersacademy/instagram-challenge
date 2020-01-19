class FatcatsController < ApplicationController
  before_action :set_fatcat, only: [:show, :edit, :update, :destroy]

  # GET /fatcats
  # GET /fatcats.json
  def index
    @fatcats = Fatcat.all
  end

  # GET /fatcats/1
  # GET /fatcats/1.json
  def show
    @comment = Comment.new
  end

  # GET /fatcats/new
  def new
    @fatcat = Fatcat.new
  end

  # GET /fatcats/1/edit
  def edit
  end

  # POST /fatcats
  # POST /fatcats.json
  def create
    @user = current_user
    @fatcat = @user.fatcats.new(fatcat_params)

    respond_to do |format|
      if @fatcat.save
        format.html { redirect_to @fatcat, notice: 'Fatcat was successfully created.' }
        format.json { render :show, status: :created, location: @fatcat }
      else
        format.html { render :new }
        format.json { render json: @fatcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /fatcats/1
  # PATCH/PUT /fatcats/1.json
  def update
    respond_to do |format|
      if @fatcat.update(fatcat_params)
        format.html { redirect_to @fatcat, notice: 'Fatcat was successfully updated.' }
        format.json { render :show, status: :ok, location: @fatcat }
      else
        format.html { render :edit }
        format.json { render json: @fatcat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fatcats/1
  # DELETE /fatcats/1.json
  def destroy
    @fatcat.destroy
    respond_to do |format|
      format.html { redirect_to fatcats_url, notice: 'Fatcat was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fatcat
      @fatcat = Fatcat.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fatcat_params
      params.require(:fatcat).permit(:caption, :image)
    end
end
