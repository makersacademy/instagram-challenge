class Picture < ApplicationRecord
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  belongs_to :user
  has_attached_file :image, :styles => { :medium => "600x500>", :thumb => "100x83>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates :name, length: { minimum: 2 }, uniqueness: true

  def build_with_user(comment, user)
    comment = comments.build(comment)
    comment.user = user
    comment
  end
end
