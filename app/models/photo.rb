class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def build_photo(photo_params, current_user_id)
    photo = Photo.create(photo_params)
    photo.user_id = current_user_id
    photo.save
  end

end
