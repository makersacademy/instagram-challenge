class Like < ActiveRecord::Base
  belongs_to :photograph
  belongs_to :user
end
