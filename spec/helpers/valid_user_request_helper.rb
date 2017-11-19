# Module for authenticating users for request specs.
module ValidUserRequestHelper
  # Signs in a valid user uwing the page.drive.post method
  def sign_in_as_valid_user
    @user ||= create(:user)
    page.driver.post user_session_path, user: { email: @user.email, password: @user.password }
    @user
  end

  def sign_in_as_user(user)
    page.driver.post user_session_path, user: { email: user.email, password: user.password }
    user
  end

  def create_user
    @user ||= create(:user)
  end

  def login_admin
    login(:admin)
  end

  def login(user)
    user = User.where(login: user.to_s).first if user.is_a?(Symbol)
    request.session[:user] = user.id
  end

  def current_user
    User.find(request.session[:user])
  end
end
