class Photo < ActiveRecord::Base
    has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
    validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

    belongs_to :user
    validates_presence_of :image
    has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception
    has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :restrict_with_exception

end
