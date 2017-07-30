class Users::IndexController < ActionController::Base

GET /users/:id
def show()
  @user = User.find(params[:id])
end

end
