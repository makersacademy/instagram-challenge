class Post < ActiveRecord::Base
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments,
          -> { extending WithUserAssociationExtension },
                dependent: :destroy
  has_attached_file :image, styles: {
    :medium => "600x550>",
    :thumb => "100x100>" },
    :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
