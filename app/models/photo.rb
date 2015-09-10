class Photo < ActiveRecord::Base

  belongs_to :user

  has_many :comments, dependent: :destroy

  validates :caption, presence: true, allow_blank: false

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_presence :image, message: "photo cannot be blank"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
