class Picture < ActiveRecord::Base
  has_attached_file :image, styles: { small: "64x64", med: "10x10", large: "20x20" }, :default_url => "weirdo.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  has_many :comments
  belongs_to :user

  def delete_picture_if current_user
    destroy if destroyable? current_user
  end

  private 

  def destroyable? current_user
    current_user.id == user_id if current_user
  end
end