class Image < ActiveRecord::Base

  has_attached_file :picture,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => ""

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  belongs_to :user


end
