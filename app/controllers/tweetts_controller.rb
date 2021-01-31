class TweettsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_image
  before_action :set_tweett, only: [:show, :edit, :update, :destroy]

  # GET images/1/tweetts
  def index
    @tweetts = @image.tweetts
  end

  # GET images/1/tweetts/1
  def show
  end

  # GET images/1/tweetts/new
  def new
    @tweett = @image.tweetts.build
  end

  # GET images/1/tweetts/1/edit
  def edit
  end

  # POST images/1/tweetts
  def create
    @tweett = @image.tweetts.build(tweett_params)

    if @tweett.save
      redirect_to(@tweett.image)
    else
      render action: "new"
    end
  end

  # PUT images/1/tweetts/1
  def update
    if @tweett.update(tweett_params)
      redirect_to([@tweett.image, @tweett], notice: "Tweett was successfully updated.")
    else
      render action: "edit"
    end
  end

  # DELETE images/1/tweetts/1
  def destroy
    @tweett.destroy

    redirect_to @image
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_image
    @image = Image.find(params[:image_id])
  end

  def set_tweett
    @tweett = @image.tweetts.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def tweett_params
    params.require(:tweett).permit(:content, :image_id)
  end
end
