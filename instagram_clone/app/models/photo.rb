class Photo < ActiveRecord::Base

  mount_uploader :image, ImageUploader

  def created_at_formatted
    self.created_at.strftime('%^b %-d %Y')
  end

end
