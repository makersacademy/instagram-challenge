class Like < ApplicationRecord
  belongs_to :user
  belongs_to :photo

  validates :user, uniqueness: { scope: :post, message: "has liked this post already" }

  def self.add_like(user, photo)
    like = self.new
    user.likes << like
    photo.likes << like
    like.save
    return like
  end
  #
  # def build_with_user(attributes = {}, user)
  #   attributes[:user] ||= user
  #   build(attributes)
  # end

end
