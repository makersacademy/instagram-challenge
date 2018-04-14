json.extract! user, :id, :username, :email, :password, :created_on, :current_sign_in, :last_sign_in, :created_at, :updated_at
json.url user_url(user, format: :json)
