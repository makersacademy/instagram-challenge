# frozen_string_literal: true

json.extract! instum, :id, :title, :caption, :created_at, :updated_at
json.url instum_url(instum, format: :json)
