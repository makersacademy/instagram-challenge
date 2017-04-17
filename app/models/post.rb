class Post < ActiveRecord::Base
  include AsUserAssociationExtension

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_many :comments, dependent: :destroy
  has_many :likes, -> { extending WithUserAssociationExtension }, dependent: :destroy
  validates_presence_of :image
  validates_presence_of :user
  belongs_to :user
end
