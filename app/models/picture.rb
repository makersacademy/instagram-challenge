class Picture < ActiveRecord::Base

  belongs_to :user
  has_many :likes, -> { extending WithUserAssociationExtension }
  has_many :comments,
        -> { extending WithUserAssociationExtension },
        dependent: :destroy
  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" }
                    # :default_url => "/images/:style/missing.png"

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  validates_presence_of :title, length: {minimum: 1}

  validates :image, :attachment_presence => true

end
