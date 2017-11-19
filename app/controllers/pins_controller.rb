class PinsController < ApplicationController
  before_action :set_pin, only: [:show]

  def index
    @pins = Pin.all
  end

  def show
    @user = current_user
  end

  def new
    @pin = Pin.new
  end

  def create
    @pin = Pin.new(pin_params)
    @pin.image = "https://storage.googleapis.com/pinstagram/uploads/#{params[:pin][:image].original_filename}"
    @pin.user_id = current_user.id

    respond_to do |format|
      if @pin.save
        ImageUploader.new.store!(params[:pin][:image])
        format.html { redirect_to @pin, notice: 'Pin was successfully created.' }
        format.json { render :show, status: :created, location: @pin }
      else
        format.html { render :new }
        format.json { render json: @pin.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_pin
      @pin = Pin.find(params[:id])
    end

    def pin_params
      params.require(:pin).permit(:caption)
    end
end
