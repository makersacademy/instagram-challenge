class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post
  has_many :likes, as: :likeable


  def author
    user.username
  end

end
