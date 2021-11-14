class HomeController < ApplicationController
  before_action :set_like, only: %i[ like ]
  helper_method :find_user_avatar, :find_user_name
  before_action :require_user, :except => [:index]

  def index
    @posts = Post.all.order("created_at DESC")
  end

  def like
    @like.liked_by = "" if @like.liked_by.nil?
    respond_to do |format|
      unless @like.liked_by.include?(",#{current_user.id},")
        liked_by = @like.liked_by + ",#{current_user.id},"
        number = @like.likes + 1
        if @like.update(likes: number, liked_by: liked_by)
          format.html { redirect_to root_url, notice: "Like was successfully updated." }
        else
          format.html { redirect_to root_url, notice: "Like was unsuccessful." }
        end
      else
        format.html { redirect_to root_url, notice: "You already liked the post" }
      end
    end
  end

  private

  def set_like
    @like = Post.find(params[:post_id])
  end

  def find_user_avatar(id)
    User.find(id).avatar
  end

  def find_user_name(id)
    User.find(id).first_name.capitalize.+(" #{User.find(id).last_name.chars.first.capitalize}.")
  end 

end
