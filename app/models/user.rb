class User < ApplicationRecord
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new
    end
  end

  private

    def user_params
      params.require(:user).permit(:firstname, :surname, :email, :username, :password)
    end
end
