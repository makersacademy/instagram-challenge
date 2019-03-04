# frozen_string_literal: true

json.extract! post, :id, :user_id, :resource_id, :created_at, :updated_at
json.url post_url(post, format: :json)
