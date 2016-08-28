class UsersController < ApplicationController

  def profile
    @posts = Post.where(user_id: current_user.id)
  end

end
