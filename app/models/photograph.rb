class Photograph < ApplicationRecord
  belongs_to :user
  has_many :admirations, dependent: :destroy
  has_many :comments,
      -> { extending WithUserAssociationExtension },
      dependent: :destroy
  has_attached_file :image, :styles => { :medium => "600x600>", :thumb => "300x300>" }, :default_url => "/photographs"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates_attachment :image, presence: true
end
