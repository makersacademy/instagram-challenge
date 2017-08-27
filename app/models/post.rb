class Post < ApplicationRecord
  has_attached_file :picture, styles: { medium: '20x20' }
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/
  belongs_to :user
end
