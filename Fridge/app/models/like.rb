class Like < ApplicationRecord
  has_one :user
  has_one :photo
end
