class Picture < ActiveRecord::Base

  has_attached_file :image,
                    :styles => {  :view => "1000x1000>",
                                  :preview => "100x100>" },
                    :default_url => "/images/:style/missing.jpeg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
