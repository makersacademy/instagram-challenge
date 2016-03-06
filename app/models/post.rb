class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments,
           -> { extending WithUserAssociationExtension },
           dependent: :destroy

  has_attached_file :photo,
                    styles: {full: '600x600', small: '240x240'},
                    default_url: '/images/:style/missing.png'
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\Z/
end
