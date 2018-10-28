# frozen_string_literal: true

# The model for comments
class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :gram
end
