class Tag < ApplicationRecord
  has_and_belongs_to_many :photos

  validates :text, presence: true,
                    format: { with: /\A\S+\z/,
                    message: "tags must not have spaces" }
end
