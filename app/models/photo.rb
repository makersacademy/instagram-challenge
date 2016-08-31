class Photo < ActiveRecord::Base
  belongs_to :user
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "640x" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/


  def self.user_create_photo(photo_params, current_user_id)
    photo = Photo.create(photo_params)
    photo.user_id = current_user_id
    photo.save
  end

end
