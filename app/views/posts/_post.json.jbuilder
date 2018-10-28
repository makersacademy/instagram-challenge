# frozen_string_literal: true

json.(post, :description, :image, :id, :created_at, :updated_at)
json.author post.user, partial: 'profiles/profile', as: :user
