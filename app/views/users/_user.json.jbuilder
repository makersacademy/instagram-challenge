json.extract! user, :id, :email, :password_digest, :username, :bio, :created_at, :updated_at
json.url user_url(user, format: :json)
