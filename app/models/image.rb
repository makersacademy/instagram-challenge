class Image < ApplicationRecord
  belongs_to :user
  has_many :comments,
    -> { extending WithUserAssociationExtension },
      dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence: true
  has_attached_file :image, :styles => { :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment :image, presence: true, content_type: { content_type: /\Aimage\/.*\Z/}

  def build_comment(attributes = {}, user)
    comment = comments.build(attributes)
    comment.user = user
    comment
  end
end
