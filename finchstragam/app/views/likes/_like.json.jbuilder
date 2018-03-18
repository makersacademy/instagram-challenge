json.extract! like, :id, :number_of_likes, :user_id, :picture_id, :created_at, :updated_at
json.url like_url(like, format: :json)
