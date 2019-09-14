# frozen_string_literal: true

class Photo < ApplicationRecord
  has_one_attached :image
end
