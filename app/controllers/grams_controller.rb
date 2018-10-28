# frozen_string_literal: true

# Does the routing for the Grams stuff
class GramsController < ApplicationController
  before_action :authenticate_user!, :set_post, only: %i[show edit update]

  def index
    @grams = Gram.order('created_at DESC')
    @comments = Comment.all
    @likes = Like.all
  end

  def show; end

  def new
    @gram = Gram.new
  end

  def create
    @gram = Gram.new(post_params)
    @gram.save
    redirect_to grams_path
  end

  def edit; end

  def update
    @gram.update_attributes(post_params)
    redirect_to gram_path
  end

  def users_grams
    if user_signed_in?
      @users_grams = Gram.where(user_id: current_user.id)
    else
      redirect_to '/'
    end
  end

  def like
    Like.create(gram_id: params[:id], user_id: current_user.id)
    flash[:success] = 'Like Counted!'
    redirect_back(fallback_location: root_path)
  end

  def unlike
    like = Like.where(gram_id: params[:id], user_id: current_user.id)[0]
    like.destroy
    flash[:success] = 'Unliked!'
    redirect_back(fallback_location: root_path)
  end

  private

  def post_params
    image_params = params.require(:gram).permit(:caption, :image)
    image_params.merge(user_id: current_user.id)
  end

  def set_post
    @gram = Gram.find(params[:id])
  end
end
