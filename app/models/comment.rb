class Comment < ActiveRecord::Base
  belongs_to :upload
  belongs_to :user
end