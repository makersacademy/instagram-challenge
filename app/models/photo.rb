class Photo < ActiveRecord::Base
  has_attached_file :image,
                    styles: { large: "500x500>",
                              medium: "400x400>",
                              thumb: "100x100>"},
                    default_url: "/images/:style/missing.png"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  belongs_to :user

  def belong_to?(user)
    user_id == user.id
  end
end
