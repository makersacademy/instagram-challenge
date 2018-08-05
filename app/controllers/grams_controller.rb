class GramsController < ApplicationController
  before_action :set_gram, only: [:show, :edit, :update, :destroy]

  # GET /grams
  # GET /grams.json
  def index
    @grams = Gram.all
  end

  # GET /grams/1
  # GET /grams/1.json
  def show
  end

  # GET /grams/new
  def new
    @gram = Gram.new
  end

  # GET /grams/1/edit
  def edit
  end

  # POST /grams
  # POST /grams.json
  def create
    @gram = Gram.new(gram_params)

    respond_to do |format|
      if @gram.save
        format.html { redirect_to @gram, notice: 'Gram was successfully created.' }
        format.json { render :show, status: :created, location: @gram }
      else
        format.html { render :new }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /grams/1
  # PATCH/PUT /grams/1.json
  def update
    respond_to do |format|
      if @gram.update(gram_params)
        format.html { redirect_to @gram, notice: 'Gram was successfully updated.' }
        format.json { render :show, status: :ok, location: @gram }
      else
        format.html { render :edit }
        format.json { render json: @gram.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /grams/1
  # DELETE /grams/1.json
  def destroy
    @gram.destroy
    respond_to do |format|
      format.html { redirect_to grams_url, notice: 'Gram was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gram
      @gram = Gram.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gram_params
      p params
      params.require(:gram).permit(:caption, :photo)
    end
end
