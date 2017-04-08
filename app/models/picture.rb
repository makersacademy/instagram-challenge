class Picture < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "600x600>", :thumb => "100x100>"}
end
