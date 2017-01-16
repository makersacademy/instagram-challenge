class Pun < ApplicationRecord

  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true

  has_attached_file :image, :styles => { :medium => "1200x1200>", :thumb => "300x300>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def belongs_to_user?(user)
  self.user == user
  end

end
