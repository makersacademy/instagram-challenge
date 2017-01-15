class Comment < ApplicationRecord

  belongs_to :photograph
  belongs_to :user

end
