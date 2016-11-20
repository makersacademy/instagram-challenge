class Photo < ApplicationRecord

  has_many :comments, as: :commentable
  has_many :reactions
  belongs_to :user


  has_attached_file :image, :styles => { :large => "<600x600>", :medium => "1000x1000>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def owner_of_photo
    User.find(self.user_id)
  end

  def return_current_user
    unless current_user.nil?
      current_user
    else
      User.new
    end
  end


  private

end
