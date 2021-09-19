class Post < ApplicationRecord
  validates :entry,
            length: {
              maximum: 100,
              too_long: '%{count} characters is the maximum allowed',
            }
  validates :entry,
            length: {
              minimum: 5,
              too_long: '%{count} characters is the minimum allowed',
            }
  has_one_attached :avatar do |attachable|
    # attachable.variant :thumb, resize: '100x100'
    attachable.representation(resize_to_limit: [nil, 50])
  end

  def likes_count
    Like.count { |x| x[:post_id] == self.id }
  end
end
