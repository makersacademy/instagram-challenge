class Image < ActiveRecord::Base

  has_attached_file :picture,
                    :styles => { :thumb => ["150x150#"], :medium => ["300x300#"], :large => ["500x500#"]},
                    :default_url => ""

  validates_attachment_content_type :picture, :content_type => /\Aimage\/.*\z/

  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :comments,
    -> { extending WithUserAssociationExtension },
    dependent: :destroy

  validates :name, length: { minimum: 3 }

end
