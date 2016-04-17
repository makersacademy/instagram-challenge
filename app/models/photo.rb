class Photo < ActiveRecord::Base
  has_attached_file :image,
                    styles: { large: "500x500>",
                              medium: "400x400>" },
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def created_by?(user)
    self.user == user
  end
end
