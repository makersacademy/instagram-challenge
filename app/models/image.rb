class Image < ActiveRecord::Base
  has_attached_file :image, :styles => { :large => "600x600>", :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  # what happens when line 3 fails? Where is validates_attachment_content_type handled?
  # that might tell us why we were getting an OAuth error...
  # But the code is all looking good! Nice job! :D :D :D
  belongs_to :user
  has_many :comments, dependent: :delete_all
  
end
