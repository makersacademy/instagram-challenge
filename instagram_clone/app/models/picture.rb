class Picture < ActiveRecord::Base
  extend Dragonfly::Model
  dragonfly_accessor :image
  belongs_to :user
  has_many :comments, dependent: :delete_all
  has_many :likes, dependent: :delete_all
end
