class Photo < ActiveRecord::Base
  belongs_to :user
  belongs_to :feed
  has_many :likes, dependent: :destroy
end
