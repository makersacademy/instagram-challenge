class Picture < ApplicationRecord
  has_attached_file :image,
                  url: "/system/:hash.:extension",
                  hash_secret: "abc123",
                  preserve_files: "true"
  validates_attachment :image,
        content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] },
        styles: { thumb: ["64x64#", :jpg], original: ['500x500>', :jpg] },
        convert_options: { thumb: "-quality 75 -strip", original: "-quality 85 -strip" }
end
