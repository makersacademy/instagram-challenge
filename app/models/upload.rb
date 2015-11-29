class Upload < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :comments

  has_attached_file :image, :styles => { :medium => "500x500>", :thumb => "200x200>" },
                    :default_url => ActionController::Base.helpers.asset_path('missing.jpg')
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
