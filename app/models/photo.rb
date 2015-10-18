class Photo < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  has_many :favourites, dependent: :destroy
  belongs_to :user

end
