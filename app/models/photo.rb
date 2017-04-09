class Photo < ActiveRecord::Base

  has_attached_file :image,
      storage: :cloudinary,
      path: ':id/:style/:filename',
      styles: { large: "600x600#", medium: "300x300#", thumb: "100x100#" }
  validates_attachment :image,
      content_type: { content_type: /\Aimage\/.*\z/ }

  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  belongs_to :user

  def get_username
    User.find(self.user_id).username
  end


end
