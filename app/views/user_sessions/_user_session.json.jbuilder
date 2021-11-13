json.extract! user_session, :id, :created_at, :updated_at
json.url user_session_url(user_session, format: :json)
