class HomeController < ApplicationController

  def index
    if current_user
      @posts = Post.order(created_at: :desc).page(params[:page]).per(5) #@Kaminari GEM pagination
      #@posts var which orders all posts into index.html
    else
      redirect_to new_user_session_path
    end
  end

end
