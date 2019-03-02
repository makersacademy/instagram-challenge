# frozen_string_literal: true

json.array! @comments, partial: 'comments/comment', as: :comment
