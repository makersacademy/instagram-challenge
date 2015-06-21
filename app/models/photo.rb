class Photo < ActiveRecord::Base

  has_attached_file :image,
                    :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :default_url => "",
                    # :default_url => "/images/:style/missing.png" # causes errors in testing
                    :url => ":s3_domain_url"
                    # :path => "/:class/:attachment/:id/:style/:filename" # will cause tests to fail if reinstated

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  belongs_to :user

  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  has_many :likes,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy

  validates_presence_of :descr

end
