class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_attached_file :image,
                    styles: { medium: '640x640', thumb: '100x100' },
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  validates_attachment :image,
                       presence: true,
                       size: { less_than: 2.megabytes }

  def build_comment(attributes, user)
    attributes[:user] ||= user
    comments.build(attributes)
  end
end
