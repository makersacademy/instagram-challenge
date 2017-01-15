class Picture < ApplicationRecord

  belongs_to :user

  has_attached_file :image, :styles => { :medium => "450x450>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment_presence :image

  has_many :comments, dependent: :destroy do
    def build_with_user(attributes = {}, user)
      attributes[:user] ||= user
      build(attributes)
    end
  end

  has_many :likes, dependent: :destroy

end
