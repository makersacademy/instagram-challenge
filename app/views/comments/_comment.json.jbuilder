# frozen_string_literal: true

json.extract! comment, :id, :post_id, :user_id, :message, :created_at, :updated_at
json.url comment_url(comment, format: :json)
