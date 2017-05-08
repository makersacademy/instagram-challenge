module Helpers
  def create_user(username: "axeman", email: "axeman@makers.com")
    User.create(username: username,
                email: email,
                password: "testtest",
                password_confirmation: "testtest")
  end
end
