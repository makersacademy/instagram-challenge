class Post < ApplicationRecord
  belongs_to :user
  has_many :comments,
                    -> { extending WithUserAssociationExtension }
  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image, :caption

  def build_comment(comment_params, user)
    comments.build_with_user(comment_params, user)
  end
end
