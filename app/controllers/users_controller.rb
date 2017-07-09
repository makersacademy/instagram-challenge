class UsersController < Clearance::UsersController

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :profile_picture)
  end
end
