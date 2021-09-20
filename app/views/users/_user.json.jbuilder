json.extract! user, :id, :username, :password, :confirm_password, :first_name, :last_name, :email, :created_at, :updated_at
json.url user_url(user, format: :json)
