class AddingPostController < ApplicationController

  def create
    @user = User.create(avatar: user_params()[:avatar], title: title_params()[:title], text: description_params()[:description])
    redirect_to adding_post_update_path
  end

  def update
    @user = User.all
  end

  private

  # Use strong_parameters for attribute whitelisting
  # Be sure to update your create() and update() controller methods.
  def user_params
    params.require(:adding_post).permit(:avatar)
  end
  def title_params
    params.require(:adding_post).permit(:title)
  end
  def description_params
    params.require(:adding_post).permit(:description)
  end
end
