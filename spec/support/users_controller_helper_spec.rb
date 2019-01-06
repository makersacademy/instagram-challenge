# frozen_string_literal: true

def valid_post_by(user)
  post :create, params: {
                        user: {
                          first_name: user.first_name,
                          last_name: user.last_name,
                          username: user.username,
                          email: user.email,
                          password: user.password
                        }
                      }
end

def invalid_post
  post :create, params: {
                        user: {
                          first_name: 'blah',
                          last_name: 'blah',
                        }
                      }
end
