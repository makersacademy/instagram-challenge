module RequestSpecHelper
  def request_test_login(user)
    post user_session_path, params: {
      user: {
        email: user.email, password: "password"
      }
    }
    follow_redirect!
  end

  def json
    JSON.parse(response.body)
  end
end
