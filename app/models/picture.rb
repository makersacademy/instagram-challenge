class Picture < ActiveRecord::Base

has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
validates_attachment :image, :presence => true,
  :content_type => { :content_type => "image/jpg" },
  :size => { :in => 0..100.kilobytes }

end
