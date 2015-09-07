class Picture < ActiveRecord::Base

  has_many :comments, dependent: :destroy

  has_attached_file :image, :styles => { :blur => "800x800>", :thumb => "800x800>" },
                    :convert_options => {:blur => "-blur 0x8"},
                    :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

end
