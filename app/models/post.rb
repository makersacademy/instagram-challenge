
class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :woofs, dependent: :destroy
  validates :title, presence: true
  validates :title, uniqueness: true

  def build_comment(attributes = {}, user)
    attributes[:user] ||= user
    comments.build(attributes)
  end

end
