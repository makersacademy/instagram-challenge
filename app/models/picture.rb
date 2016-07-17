class Picture < ActiveRecord::Base
  has_attached_file :photo, styles: { large: '700x700#', medium: '400x400#' }
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user
end
