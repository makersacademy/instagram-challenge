class Image < ActiveRecord::Base

  belongs_to :user

  has_attached_file :picture,
                    :styles => { :large => "800x600", :medium => "300x300>", :thumb => "100x100>"}
  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/
end
