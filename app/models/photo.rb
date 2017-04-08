class Photo < ActiveRecord::Base

  has_attached_file :image,
      storage: :cloudinary,
      path: ':id/:style/:filename',
      styles: { large: "600x600>", medium: "300x300>", thumb: "100x100>" }
  validates_attachment :image,
      presence: true,
      content_type: { content_type: /\Aimage\/.*\z/ }

end
