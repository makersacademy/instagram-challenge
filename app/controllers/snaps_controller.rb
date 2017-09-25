class SnapsController < ApplicationController
  # before_action :require_login
  before_action :set_snap, only: %i[show edit update destroy upvote downvote]

  # GET /snaps
  # GET /snaps.json
  def index
    @snaps = Snap.all.sort_by(&:created_at).reverse
  end

  # GET /snaps/1
  # GET /snaps/1.json
  def show
    @comments = Comment.where(snap_id: @snap).order("created_at DESC")
  end

  # GET /snaps/new
  def new
    @snap = Snap.new
  end

  # GET /snaps/1/edit
  def edit; end

  def upvote
    @snap.upvote_from current_user
    redirect_to snaps_path
  end

  def downvote
    @snap.downvote_from current_user
    redirect_to snaps_path
  end

  # POST /snaps
  # POST /snaps.json
  def create
    @snap = Snap.new(snap_params)
    @snap.snap_user = current_user.email

    respond_to do |format|
      if @snap.save
        format.html { redirect_to '/', notice: 'Snap was successfully created.' }
        format.json { render :show, status: :created, location: @snap }
      else
        format.html { render :new }
        format.json { render json: @snap.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @snap.destroy
    respond_to do |format|
      format.html { redirect_to snaps_url, notice: 'Snap was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_snap
    @snap = Snap.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def snap_params
    params.require(:snap).permit(:image, :caption)
  end
end
