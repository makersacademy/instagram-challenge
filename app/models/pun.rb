class Pun < ApplicationRecord

  belongs_to :user
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_attached_file :image, :styles => { :medium => "1080x1080>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def belongs_to_user?(user)
  self.user == user
  end

end
