class Photo < ActiveRecord::Base
  include AsUserAssociationExtension
  
  has_many :comments,  
        -> { extending WithUserAssociationExtension }, 
        dependent: :destroy
  belongs_to :user
  has_many :likes, dependent: :destroy
  validates :user_id, presence: true
  
  
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "cat.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
