# frozen_string_literal: true

# json.extract! comment, :id, :body, :post_id, :user_id, :created_at, :updated_at
# json.url comment_url(comment, format: :json)
#

json.(comment, :id, :created_at, :updated_at, :body)
json.author comment.user, partial: 'profiles/profile', as: :user
