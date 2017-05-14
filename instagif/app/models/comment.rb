class Comment < ApplicationRecord
  belongs_to :gif
  validates :comment, presence: true, allow_blank: false
end
