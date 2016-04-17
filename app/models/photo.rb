class Photo < ActiveRecord::Base
  belongs_to :user

  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  def self.create_photo_with_user(photo_params, current_user_id)
    photo = Photo.create(photo_params)
    photo.user_id = current_user_id
    photo.save
  end

  def self.find_and_delete_photo(photo_id, current_user)
    photo = Photo.find(photo_id)
    photo.delete_if_authorized(current_user)
  end

  def delete_if_authorized(current_user)  
    destroy if authorized_to_delete(current_user)
  end

  def authorized_to_delete(current_user)
    user_id == current_user.id
  end
end
