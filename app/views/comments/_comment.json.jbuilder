# frozen_string_literal: true

json.(comment, :id, :created_at, :updated_at, :body)
json.author comment.user, partial: 'profiles/profile', as: :user
