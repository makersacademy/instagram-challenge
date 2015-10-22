class Picture < ActiveRecord::Base

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  belongs_to :user

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :user_id, presence: true
  validates :image_file_name, presence: true

  def owner?(user)
    user != nil && user.id == self.user_id
  end
end
