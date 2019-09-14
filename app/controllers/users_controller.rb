class UsersController < ApplicationController
def show

end
def edit
  @user = User.find(params[:id])
end

def update
  current_user.update(user_params)
  redirect_to current_user
end
def show
  @user  = User.find(params[:id])
  @posts = @user.posts.order(created_at: :desc)
end

def user_params
  params.require(:user).permit(:username, :name, :website,
                    :bio, :email, :phone, :gender, :avatar)
end
end
