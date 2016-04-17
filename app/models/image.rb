class Image < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
  has_attached_file :image, :styles => { :medium => "400x400>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  acts_as_votable

  def self.save_with_current_user(params, user)
    image = Image.new(params)
    image.user_id = user.id
    image.save
  end

  def self.all_from_a_user(id)
    user = User.find(id)
    image = Image.all
    user.images
  end

  def self.delete(id)
    image = Image.find(id)
    image.destroy 
  end
end
