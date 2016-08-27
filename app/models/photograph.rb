class Photograph < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy
end
