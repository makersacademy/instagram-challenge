# frozen_string_literal: true

json.array! @photos, partial: "photos/photo", as: :photo
