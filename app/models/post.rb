class Post < ApplicationRecord

  has_attached_file :image, styles: { large: "800x800", medium: "400x400", thumb: "100x100" }
  validates_attachment_content_type :image, :content_type => ['image/jpg', 'image/jpeg', 'image/png']

  acts_as_votable
end
