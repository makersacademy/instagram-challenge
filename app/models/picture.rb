class Picture < ActiveRecord::Base
  has_many :comments
end
