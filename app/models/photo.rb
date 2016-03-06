class Photo < ActiveRecord::Base

  has_many :comments, dependent: :destroy
  belongs_to :user

  def build_review(attributes = {}, user)
    attributes[:user] ||= user
    comments.build(attributes)
  end
end
