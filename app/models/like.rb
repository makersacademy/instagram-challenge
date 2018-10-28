# frozen_string_literal: true

# The model for likes
class Like < ApplicationRecord
  belongs_to :user
  belongs_to :gram
end
