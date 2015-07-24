class Picture < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :medium => "300x300", :thumb => "100X100" },
                    :default_url => "/images/:style/missing.png",
                    :path => "#{Rails.root}/public/system/:class/:id_partition/:style.:extension",
                    :storage => :filesystem

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :descr

end
