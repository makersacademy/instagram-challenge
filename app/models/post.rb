class Post < ApplicationRecord
  belongs_to :user
  has_many :likes
  has_many :comments,
                -> { extending WithUserAssociationExtension },
                    dependent: :destroy

  validates :description, length: { minimum: 1 }

  has_attached_file :image, :styles =>  { :large => "600x600", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments do
    def build_with_user(attributes = {}, user)
      attributes[:user] ||= user
      build(attributes)
    end
  end
end
