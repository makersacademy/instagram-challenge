class FriendshipsController < ApplicationController
      # before_action :set_friendship, only: %i[ destroy ]

  # GET /comments or /comments.json
  def index
    @friendships = Friendship.all
  end

  # GET /comments/new
  def new
    @friendship = Friendship.new
  end

  # POST /comments or /comments.json
  def create
    if params[:user_id] != params[:friend_id]
      @friendship = Friendship.new(friendship_params)

      respond_to do |format|
        if @friendship.save
          format.html { redirect_to request.referer, notice: "You made a new friend :-)" }
        else
          format.html { redirect_to request.referer, notice: "Failed to add friend :-(" }
        end
      end
    else
      format.html { redirect_to request.referer, notice: "You are already your own dearest friend!" }
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    f1 = Friendship.find_by(user_id: params[:user_id], friend_id: params[:friend_id])
    f2 = Friendship.find_by(user_id: params[:friend_id], friend_id: params[:user_id])
    
    @friendship = f1 ? f1 : f2

    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to request.referer, notice: "Unfriended." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def friendship_params
      params.permit(:user_id, :friend_id)
    end
end
