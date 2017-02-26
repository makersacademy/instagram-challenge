class Photo < ApplicationRecord

  has_attached_file :image,
                    :style => { :medium => "640x640",
                    :thumb => "100x100>" },
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image,
                                    :content_type => /\Aimage\/.*\Z/
end
