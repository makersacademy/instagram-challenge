# frozen_string_literal: true

json.extract! resource, :id, :post_id, :location, :created_at, :updated_at
json.url resource_url(resource, format: :json)
