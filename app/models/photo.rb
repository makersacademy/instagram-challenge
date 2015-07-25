class Photo < ActiveRecord::Base

  has_attached_file :image, :styles => { :croppable => '600x600', :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => ""
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
