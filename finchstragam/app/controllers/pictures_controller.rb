class PicturesController < ApplicationController
  before_action :set_picture, only: [:show, :edit, :update, :destroy]

  before_action :authenticate_user!, except: [:index]

  # GET /pictures
  # GET /pictures.json
  def index
    @pictures = Picture.all
  end

  # GET /pictures/1
  # GET /pictures/1.json
  def show
    @pictures = Picture.find(params['id'])
    @comments = @pictures.comments

    @liked = Like.where({ 'user_id': current_user.id }).where('picture_id': @picture.id).present?
  end

  # GET /pictures/new
  def new
    @picture = Picture.new
  end

  # GET /pictures/1/edit
  def edit
    check_user
  end

  # POST /pictures
  # POST /pictures.json
  def create
    @picture = current_user.pictures.new(picture_params)

    respond_to do |format|
      if @picture.save
        format.html { redirect_to @picture, notice: 'Picture was successfully created.' }
        format.json { render :show, status: :created, location: @picture }
      else
        format.html { render :new }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pictures/1
  # PATCH/PUT /pictures/1.json
  def update
    respond_to do |format|
      if @picture.update(picture_params)
        format.html { redirect_to @picture, notice: 'Picture was successfully updated.' }
        format.json { render :show, status: :ok, location: @picture }
      else
        format.html { render :edit }
        format.json { render json: @picture.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pictures/1
  # DELETE /pictures/1.json
  def destroy
    @picture.destroy
    respond_to do |format|
      format.html { redirect_to pictures_url, notice: 'Picture was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # POST /pictures/:id/like
  def like
    @picture = Picture.find(params['picture_id'])
    @like = @picture.likes.new({ 'user_id': current_user.id })

    begin
      redirect_to @picture, notice: 'You liked this picture!' if @like.save
    rescue => exception
      redirect_to @picture, alert: 'You already like this picture, do not be greedy!'
    end

    # Like.where('user_id', 1).where('photo_id', 1)
    # .exist() // Si devuelve true es que le ha dado like, si devuelve false, que no
  end

  # DELETE /pictures/:id/unlike
  def unlike
    @picture = Picture.find(params['picture_id'])
    @like = Like.where({ 'user_id': current_user }).where('picture_id': @picture.id)

    Like.delete(@like)
    redirect_to @picture, notice: "You unliked this picture!"
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_picture
    @picture = Picture.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def picture_params
    params.require(:picture).permit(:link, :description)
  end

  def check_user
    if current_user.id != @picture[:user_id]
      redirect_to pictures_path, alert: 'You shall not pass'
    end
  end
end
