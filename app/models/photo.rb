class Photo < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_attached_file :image,
                    styles: { thumb: ["300x300#", :jpg],
                              original: ['500x500>', :jpg] },
                    convert_options: { thumb: "-quality 75 -strip",
                                       original: "-quality 85 -strip" }

  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
end
