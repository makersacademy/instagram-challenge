class Experience < ApplicationRecord
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :large => "500x500>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :image, attachment_presence: true

  def self.chronological
    self.all.reverse
  end
end
