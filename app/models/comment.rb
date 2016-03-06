class Comment < ActiveRecord::Base
  belongs_to :image, dependent: :destroy
end
