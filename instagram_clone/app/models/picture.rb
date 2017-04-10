class Picture < ActiveRecord::Base
  extend Dragonfly::Model
  dragonfly_accessor :image
  belongs_to :user
  has_many :comments
  has_many :likes
end
