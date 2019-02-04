# frozen_string_literal: true

class InstaController < ApplicationController
  before_action :set_instum, only: [:show, :edit, :update, :destroy]

  # GET /insta
  # GET /insta.json
  def index
    @insta = Instum.all
  end

  # GET /insta/1
  # GET /insta/1.json
  def show
  end

  # GET /insta/new
  def new
    @instum = Instum.new
  end

  # GET /insta/1/edit
  def edit
  end

  # POST /insta
  # POST /insta.json
  def create
    @instum = Instum.new(instum_params)

    respond_to do |format|
      if @instum.save
        format.html { redirect_to @instum, notice: 'Instum was successfully created.' }
        format.json { render :show, status: :created, location: @instum }
      else
        format.html { render :new }
        format.json { render json: @instum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /insta/1
  # PATCH/PUT /insta/1.json
  def update
    respond_to do |format|
      if @instum.update(instum_params)
        format.html { redirect_to @instum, notice: 'Instum was successfully updated.' }
        format.json { render :show, status: :ok, location: @instum }
      else
        format.html { render :edit }
        format.json { render json: @instum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /insta/1
  # DELETE /insta/1.json
  def destroy
    @instum.destroy
    respond_to do |format|
      format.html { redirect_to insta_url, notice: 'Instum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_instum
    @instum = Instum.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def instum_params
    params.require(:instum).permit(:title, :caption, :image)
  end
end
