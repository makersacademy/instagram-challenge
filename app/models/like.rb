# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :message
  belongs_to :user
end
