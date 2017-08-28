class Post < ApplicationRecord
  belongs_to :user
  has_many :comments

  validates :user_id, presence: true
  validates :image, attachment_presence: true

  has_attached_file :image, styles: { medium: '400px' }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def self.reverse_order
    all.reverse
  end
end
