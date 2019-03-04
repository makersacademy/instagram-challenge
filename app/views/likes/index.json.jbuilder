# frozen_string_literal: true

json.array! @likes, partial: 'likes/like', as: :like
