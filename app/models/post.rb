class Post < ApplicationRecord
  validates :entry,
            length: {
              maximum: 100,
              too_long: '%{count} characters is the maximum allowed',
            },
            length: {
              minimum: 5,
              too_long: '%{count} characters is the minimum allowed',
            }
end
