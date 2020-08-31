class Post < ApplicationRecord
  has_many :comments
  accepts_nested_attributes_for :comments
end
