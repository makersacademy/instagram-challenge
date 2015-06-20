class Photo < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  validates_presence_of :descr

end
