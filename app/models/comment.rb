class Comment < ApplicationRecord
  belongs_to :snap
  belongs_to :user
end
