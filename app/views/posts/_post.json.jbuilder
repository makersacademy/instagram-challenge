# frozen_string_literal: true

json.extract! post, :id, :caption, :picture, :created_at, :updated_at
json.url post_url(post, format: :json)
