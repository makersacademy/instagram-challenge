class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :avatar, default_url: "/images/:style/missing.png"

  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates_presence_of :avatar, message: "Whoops, looks like you forgot to include your image"
  validates :comment, length: { maximum: 100, too_long: "Your caption is too long m8, only %{count} chars tops, soz"}

end
