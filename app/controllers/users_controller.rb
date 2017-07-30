class UsersController < ActionController::Base


def show
  @user = User.find(params[:id])
  render 'show'
end

end
