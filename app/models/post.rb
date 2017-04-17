class Post < ActiveRecord::Base
  validates :user_id, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_presence_of :image

  belongs_to :user

  has_many :comments, dependent: :destroy
  acts_as_votable
end
