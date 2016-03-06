class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy

  has_attached_file :photo,
                    styles: {full: '1024x1024', small: '480x480'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
